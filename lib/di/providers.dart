import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/services/audio_player_service.dart';
import '../data/services/audio_visualizer_service.dart';
import '../data/services/color_extraction_service.dart';
import '../data/repositories/audio_query_repository.dart';
import '../data/repositories/playlist_repository.dart';
import '../data/repositories/favorites_repository.dart';
import '../data/repositories/recently_played_repository.dart';
import '../data/repositories/settings_repository.dart';
import '../data/repositories/equalizer_repository.dart';

part 'providers.g.dart';

@riverpod
SharedPreferences sharedPreferences(SharedPreferencesRef ref) {
  throw UnimplementedError('Must be overridden in ProviderScope');
}

@riverpod
AudioQueryRepository audioQueryRepository(AudioQueryRepositoryRef ref) {
  return AudioQueryRepository();
}

@riverpod
PlaylistRepository playlistRepository(PlaylistRepositoryRef ref) {
  return PlaylistRepository();
}

@riverpod
FavoritesRepository favoritesRepository(FavoritesRepositoryRef ref) {
  return FavoritesRepository();
}

@riverpod
RecentlyPlayedRepository recentlyPlayedRepository(RecentlyPlayedRepositoryRef ref) {
  return RecentlyPlayedRepository();
}

@riverpod
SettingsRepository settingsRepository(SettingsRepositoryRef ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return SettingsRepository(prefs);
}

@riverpod
EqualizerRepository equalizerRepository(EqualizerRepositoryRef ref) {
  return EqualizerRepository();
}

@riverpod
AudioPlayerService audioPlayerService(AudioPlayerServiceRef ref) {
  return AudioPlayerService();
}

@riverpod
AudioVisualizerService audioVisualizerService(AudioVisualizerServiceRef ref) {
  return AudioVisualizerService();
}

@riverpod
ColorExtractionService colorExtractionService(ColorExtractionServiceRef ref) {
  return ColorExtractionService();
}
