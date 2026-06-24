import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:on_audio_query/on_audio_query.dart';

enum VisualizerType { bars, circular, wave, particles }

class SettingsRepository {
  final SharedPreferences _prefs;

  SettingsRepository(this._prefs);

  // Theme
  ThemeMode get themeMode {
    final val = _prefs.getString('themeMode');
    return ThemeMode.values.firstWhere((e) => e.toString() == val, orElse: () => ThemeMode.system);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await _prefs.setString('themeMode', mode.toString());
  }

  // Sort order for songs
  SongSortType get songSortOrder {
    final val = _prefs.getInt('songSortOrder');
    return SongSortType.values[val ?? 0];
  }

  Future<void> setSongSortOrder(SongSortType sort) async {
    await _prefs.setInt('songSortOrder', sort.index);
  }

  // Default visualizer type
  VisualizerType get defaultVisualizer {
    final val = _prefs.getString('defaultVisualizer');
    return VisualizerType.values.firstWhere((e) => e.toString() == val, orElse: () => VisualizerType.bars);
  }

  Future<void> setDefaultVisualizer(VisualizerType type) async {
    await _prefs.setString('defaultVisualizer', type.toString());
  }

  // Onboarding completed
  bool get onboardingCompleted => _prefs.getBool('onboardingCompleted') ?? false;

  Future<void> setOnboardingCompleted(bool completed) async {
    await _prefs.setBool('onboardingCompleted', completed);
  }

  // Last used tab index
  int get lastTabIndex => _prefs.getInt('lastTabIndex') ?? 0;

  Future<void> setLastTabIndex(int index) async {
    await _prefs.setInt('lastTabIndex', index);
  }
}
