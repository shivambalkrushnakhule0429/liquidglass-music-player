import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:liquidglass_music_player/state/providers/playlist_provider.dart';
import '../../core/constants/app_typography.dart';
import '../widgets/glass/glass_panel.dart';

class PlaylistsTabScreen extends ConsumerWidget {
  const PlaylistsTabScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlistsAsync = ref.watch(playlistsProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "My Playlists",
                style: AppTypography.displaySmall(context).copyWith(color: Colors.white),
              ),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.white),
                onPressed: () => context.push('/playlist/create'),
              ),
            ],
          ),
        ),
        // Smart Playlists
        _buildSmartPlaylist(context, "Favorites", Icons.favorite, Colors.redAccent, () => context.push('/favorites')),
        _buildSmartPlaylist(context, "Recently Played", Icons.history, Colors.blueAccent, () => context.push('/recent')),

        const Divider(color: Colors.white10, indent: 16, endIndent: 16),

        Expanded(
          child: playlistsAsync.when(
            data: (playlists) => playlists.isEmpty
              ? const Center(child: Text("No playlists created yet", style: TextStyle(color: Colors.white60)))
              : ListView.builder(
                  itemCount: playlists.length,
                  itemBuilder: (context, index) {
                    final playlist = playlists[index];
                    return ListTile(
                      leading: GlassPanel(
                        padding: EdgeInsets.zero,
                        borderRadius: 8,
                        child: Container(
                          width: 48,
                          height: 48,
                          child: const Icon(Icons.playlist_play, color: Colors.white70),
                        ),
                      ),
                      title: Text(playlist.name, style: const TextStyle(color: Colors.white)),
                      subtitle: Text("${playlist.songCount} songs", style: const TextStyle(color: Colors.white60)),
                      onTap: () => context.push('/playlist/${playlist.id}'),
                    );
                  },
                ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text("Error: $err")),
          ),
        ),
      ],
    );
  }

  Widget _buildSmartPlaylist(BuildContext context, String title, IconData icon, Color color, VoidCallback onTap) {
    return ListTile(
      leading: GlassPanel(
        padding: EdgeInsets.zero,
        borderRadius: 8,
        borderColor: color.withValues(alpha: (0.3)),
        child: Container(
          width: 48,
          height: 48,
          child: Icon(icon, color: color),
        ),
      ),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }
}
