import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import '../models/song_model.dart';

class AudioPlayerService {
  final AudioPlayer _player = AudioPlayer();

  Future<void> init() async {
    // Initial setup if needed
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
    await _player.setAudioSource(playlist, initialIndex: startIndex);
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
