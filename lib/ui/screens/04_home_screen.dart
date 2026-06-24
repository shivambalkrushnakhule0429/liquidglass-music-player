import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '05_songs_tab_screen.dart';
import '06_albums_tab_screen.dart';
import '07_artists_tab_screen.dart';
import '08_playlists_tab_screen.dart';
import '../widgets/player/mini_player.dart';
import '../widgets/glass/glass_panel.dart';
import '../../core/constants/app_colors.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const SongsTabScreen(),
    const AlbumsTabScreen(),
    const ArtistsTabScreen(),
    const PlaylistsTabScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text("AURA", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.settings, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.defaultBackgroundDark, Color(0xFF1A1A2E)],
          ),
        ),
        child: Column(
          children: [
            Expanded(child: _tabs[_currentIndex]),
            const MiniPlayer(),
            const SizedBox(height: 80), // Space for bottom nav
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: GlassPanel(
          borderRadius: 32,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.music_note, "Songs"),
              _buildNavItem(1, Icons.album, "Albums"),
              _buildNavItem(2, Icons.person, "Artists"),
              _buildNavItem(3, Icons.playlist_play, "Playlists"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.primaryAccent : Colors.white60,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isSelected ? AppColors.primaryAccent : Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}
