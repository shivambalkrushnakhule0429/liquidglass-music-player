import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:just_audio/just_audio.dart' as ja;
import 'package:flutter/material.dart';
import 'player_state.dart';
import '../../data/models/song_model.dart';
import '../../di/providers.dart';

part 'player_notifier.g.dart';

@riverpod
class PlayerNotifier extends _$PlayerNotifier {
  @override
  PlayerState build() {
    final playerService = ref.watch(audioPlayerServiceProvider);

    // Position listener
    final posSub = playerService.positionStream.listen((pos) {
      state = state.copyWith(position: pos);
    });

    // Duration listener
    final durSub = playerService.durationStream.listen((dur) {
      if (dur != null) {
        state = state.copyWith(duration: dur);
      }
    });

    // Player state listener
    final stateSub = playerService.playerStateStream.listen((jaState) {
       PlaybackState pbState;
       switch (jaState.processingState) {
         case ja.ProcessingState.idle:
           pbState = PlaybackState.idle;
           break;
         case ja.ProcessingState.loading:
         case ja.ProcessingState.buffering:
           pbState = PlaybackState.loading;
           break;
         case ja.ProcessingState.ready:
           pbState = jaState.playing ? PlaybackState.playing : PlaybackState.paused;
           break;
         case ja.ProcessingState.completed:
           pbState = PlaybackState.completed;
           break;
       }
       state = state.copyWith(playbackState: pbState);
    });

    ref.onDispose(() {
      posSub.cancel();
      durSub.cancel();
      stateSub.cancel();
    });

    return PlayerState.initial();
  }

  Future<void> playSong(SongModel song, {List<SongModel>? queue}) async {
    state = state.copyWith(currentSong: song, queue: queue ?? [song], isLoading: true);

    // Extract accent color
    _updateAccentColor(song.id);

    await ref.read(audioPlayerServiceProvider).playSong(song);
  }

  Future<void> _updateAccentColor(int songId) async {
    final artwork = await ref.read(audioQueryRepositoryProvider).getAlbumArt(songId);
    if (artwork != null) {
      final color = await ref.read(colorExtractionServiceProvider).extractAccentColor(MemoryImage(artwork));
      if (color != null) {
        state = state.copyWith(accentColor: color);
      }
    }
  }

  Future<void> pause() async {
    await ref.read(audioPlayerServiceProvider).pause();
  }

  Future<void> resume() async {
    await ref.read(audioPlayerServiceProvider).resume();
  }

  Future<void> seekTo(Duration position) async {
    await ref.read(audioPlayerServiceProvider).seekTo(position);
  }
}
