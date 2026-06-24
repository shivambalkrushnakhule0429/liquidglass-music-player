import 'package:audio_service/audio_service.dart';

class AuraAudioHandler extends BaseAudioHandler with SeekHandler {
  // Simplified background audio handler that updates playback state and media items

  @override
  Future<void> play() async => playbackState.add(playbackState.value.copyWith(playing: true));

  @override
  Future<void> pause() async => playbackState.add(playbackState.value.copyWith(playing: false));

  @override
  Future<void> seek(Duration position) async => playbackState.add(playbackState.value.copyWith(updatePosition: position));
}
