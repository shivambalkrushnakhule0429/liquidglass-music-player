import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'core/theme/app_theme.dart';
import 'router/app_router.dart';
import 'di/providers.dart';
import 'data/models/playlist_model.dart';
import 'data/repositories/playlist_repository.dart';
import 'data/repositories/favorites_repository.dart';
import 'data/repositories/recently_played_repository.dart';
import 'data/repositories/equalizer_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await JustAudioBackground.init(
    androidNotificationChannelId: 'aura_music_playback',
    androidNotificationChannelName: 'Aura Music Playback',
    androidNotificationOngoing: true,
  );

  await Hive.initFlutter();
  Hive.registerAdapter(PlaylistModelAdapter());

  final playlistRepo = PlaylistRepository();
  await playlistRepo.init();

  final favoritesRepo = FavoritesRepository();
  await favoritesRepo.init();

  final recentRepo = RecentlyPlayedRepository();
  await recentRepo.init();

  final eqRepo = EqualizerRepository();
  await eqRepo.init();

  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        playlistRepositoryProvider.overrideWithValue(playlistRepo),
        favoritesRepositoryProvider.overrideWithValue(favoritesRepo),
        recentlyPlayedRepositoryProvider.overrideWithValue(recentRepo),
        equalizerRepositoryProvider.overrideWithValue(eqRepo),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'AURA',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
