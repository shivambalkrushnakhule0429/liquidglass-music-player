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

    // Index listener for auto-updates
    final indexSub = playerService.currentIndexStream.listen((index) {
       if (index != null && state.queue.isNotEmpty && index < state.queue.length) {
         final currentSong = state.queue[index];
         if (currentSong.id != state.currentSong?.id) {
            state = state.copyWith(currentSong: currentSong, currentIndex: index);
            _updateAccentColor(currentSong.id);
         }
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
      indexSub.cancel();
      stateSub.cancel();
    });

    return PlayerState.initial();
  }

  Future<void> playSong(SongModel song, {List<SongModel>? queue}) async {
    final songs = queue ?? [song];
    final index = songs.indexWhere((s) => s.id == song.id);

    state = state.copyWith(
      currentSong: song,
      queue: songs,
      currentIndex: index >= 0 ? index : 0,
      isLoading: true,
    );

    _updateAccentColor(song.id);

    await ref.read(audioPlayerServiceProvider).setQueue(songs, startIndex: state.currentIndex);
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

  Future<void> next() async {
    await ref.read(audioPlayerServiceProvider).next();
  }

  Future<void> previous() async {
    await ref.read(audioPlayerServiceProvider).previous();
  }

  Future<void> seekTo(Duration position) async {
    await ref.read(audioPlayerServiceProvider).seekTo(position);
  }

  Future<void> setVolume(double volume) async {
    state = state.copyWith(volume: volume, isMuted: volume == 0);
    await ref.read(audioPlayerServiceProvider).setVolume(volume);
  }

  Future<void> toggleMute() async {
    if (state.isMuted) {
      final newVolume = state.previousVolume > 0 ? state.previousVolume : 1.0;
      state = state.copyWith(isMuted: false, volume: newVolume);
      await ref.read(audioPlayerServiceProvider).setVolume(newVolume);
    } else {
      state = state.copyWith(isMuted: true, previousVolume: state.volume, volume: 0);
      await ref.read(audioPlayerServiceProvider).setVolume(0);
    }
  }

  Future<void> setSpeed(double speed) async {
    state = state.copyWith(speed: speed);
    await ref.read(audioPlayerServiceProvider).setSpeed(speed);
  }
}
