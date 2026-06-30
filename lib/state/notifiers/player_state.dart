import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import '../../data/models/song_model.dart';

part 'player_state.freezed.dart';

@freezed
class PlayerState with _$PlayerState {
  const factory PlayerState({
    SongModel? currentSong,
    @Default([]) List<SongModel> queue,
    @Default(0) int currentIndex,
    @Default(Duration.zero) Duration position,
    @Default(Duration.zero) Duration duration,
    @Default(PlaybackState.idle) PlaybackState playbackState,
    @Default(false) bool shuffleEnabled,
    @Default(RepeatMode.off) RepeatMode repeatMode,
    @Default(1.0) double volume,
    @Default(1.0) double previousVolume,
    @Default(false) bool isMuted,
    @Default(1.0) double speed,
    Color? accentColor,
    String? albumArtUri,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _PlayerState;

  factory PlayerState.initial() => const PlayerState();
}

enum PlaybackState { idle, loading, playing, paused, completed, error }
enum RepeatMode { off, all, one }
