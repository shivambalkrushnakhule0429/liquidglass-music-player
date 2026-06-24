import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/song_model.dart';
import '../../../state/providers/playlist_provider.dart';
import '../../../di/providers.dart';
import '../widgets/glass/glass_panel.dart';

class AddToPlaylistSheet extends ConsumerWidget {
  final SongModel song;

  const AddToPlaylistSheet({super.key, required this.song});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playlistsAsync = ref.watch(playlistsProvider);

    return GlassPanel(
      padding: const EdgeInsets.symmetric(vertical: 20),
      borderRadius: 24,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Add to Playlist", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Flexible(
            child: playlistsAsync.when(
              data: (playlists) => ListView.builder(
                shrinkWrap: true,
                itemCount: playlists.length,
                itemBuilder: (context, index) {
                  final playlist = playlists[index];
                  return ListTile(
                    leading: const Icon(Icons.playlist_add, color: Colors.white70),
                    title: Text(playlist.name, style: const TextStyle(color: Colors.white)),
                    onTap: () {
                      ref.read(playlistRepositoryProvider).addSongToPlaylist(playlist.id, song);
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Added to ${playlist.name}")),
                      );
                    },
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (err, s) => Center(child: Text("Error: $err")),
            ),
          ),
        ],
      ),
    );
  }
}
