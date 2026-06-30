import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:audio_session/audio_session.dart';
import '../models/song_model.dart';

class AudioPlayerService {
  late final AudioPlayer _player;
  final AndroidEqualizer _equalizer = AndroidEqualizer();

  AudioPlayerService() {
    _player = AudioPlayer(
      audioPipeline: AudioPipeline(
        androidAudioEffects: [
          _equalizer,
        ],
      ),
    );
  }

  Future<void> init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
  }

  void dispose() {
    _player.dispose();
  }

  Future<void> playSong(SongModel song) async {
    await _player.setAudioSource(AudioSource.uri(
      Uri.parse(song.uri),
      tag: MediaItem(
        id: song.id.toString(),
        album: song.album,
        title: song.title,
        artist: song.artist,
        duration: song.duration,
      ),
    ));
    await _player.play();
  }

  Future<void> setQueue(List<SongModel> songs, {int startIndex = 0}) async {
    final playlist = ConcatenatingAudioSource(
      children: songs.map((song) => AudioSource.uri(
        Uri.parse(song.uri),
        tag: MediaItem(
          id: song.id.toString(),
          album: song.album,
          title: song.title,
          artist: song.artist,
          duration: song.duration,
        ),
      )).toList(),
    );
    await _player.setAudioSource(playlist, initialIndex: startIndex, preload: true);
    await _player.play();
  }

  Future<void> pause() async => await _player.pause();
  Future<void> resume() async => await _player.play();
  Future<void> stop() async => await _player.stop();
  Future<void> seekTo(Duration position) async => await _player.seek(position);
  Future<void> next() async => await _player.seekToNext();
  Future<void> previous() async => await _player.seekToPrevious();

  Future<void> setVolume(double volume) async => await _player.setVolume(volume);
  Future<void> setSpeed(double speed) async => await _player.setSpeed(speed);

  // EQ Controls
  AndroidEqualizer get equalizer => _equalizer;

  Future<void> setEqualizerBand(int bandIndex, double gain) async {
    final bands = await _equalizer.parameters;
    if (bandIndex < bands.bands.length) {
       await bands.bands[bandIndex].setGain(gain);
    }
  }

  Stream<Duration> get positionStream => _player.positionStream;
  Stream<Duration?> get durationStream => _player.durationStream;
  Stream<PlayerState> get playerStateStream => _player.playerStateStream;
  Stream<bool> get playingStream => _player.playingStream;
  Stream<int?> get currentIndexStream => _player.currentIndexStream;

  Duration get position => _player.position;
  Duration? get duration => _player.duration;
  bool get isPlaying => _player.playing;
  int? get currentIndex => _player.currentIndex;
}
