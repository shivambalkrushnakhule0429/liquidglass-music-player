import 'package:go_router/go_router.dart';
import '../ui/screens/01_splash_screen.dart';
import '../ui/screens/02_onboarding_screen.dart';
import '../ui/screens/03_permission_screen.dart';
import '../ui/screens/04_home_screen.dart';
import '../ui/screens/09_now_playing_screen.dart';
import '../ui/screens/10_search_screen.dart';
import '../ui/screens/12_album_detail_screen.dart';
import '../ui/screens/13_artist_detail_screen.dart';
import '../ui/screens/14_playlist_detail_screen.dart';
import '../ui/screens/15_create_playlist_screen.dart';
import '../ui/screens/16_favorites_screen.dart';
import '../ui/screens/17_recently_played_screen.dart';
import '../ui/screens/19_equalizer_screen.dart';
import '../ui/screens/20_sleep_timer_screen.dart';
import '../ui/screens/21_settings_screen.dart';
import '../ui/screens/22_about_screen.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/permission',
      builder: (context, state) => const PermissionScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/now-playing',
      builder: (context, state) => const NowPlayingScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/album/:id',
      builder: (context, state) => AlbumDetailScreen(
        albumId: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: '/artist/:id',
      builder: (context, state) => ArtistDetailScreen(
        artistId: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: '/playlist/:id',
      builder: (context, state) => PlaylistDetailScreen(
        playlistId: int.parse(state.pathParameters['id']!),
      ),
    ),
    GoRoute(
      path: '/playlist/create',
      builder: (context, state) => const CreatePlaylistScreen(),
    ),
    GoRoute(
      path: '/favorites',
      builder: (context, state) => const FavoritesScreen(),
    ),
    GoRoute(
      path: '/recent',
      builder: (context, state) => const RecentlyPlayedScreen(),
    ),
    GoRoute(
      path: '/equalizer',
      builder: (context, state) => const EqualizerScreen(),
    ),
    GoRoute(
      path: '/sleep-timer',
      builder: (context, state) => const SleepTimerScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutScreen(),
    ),
  ],
);
