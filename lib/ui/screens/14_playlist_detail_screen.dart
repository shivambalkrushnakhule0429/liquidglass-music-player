import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../state/providers/song_provider.dart';
import '../widgets/common/song_list_tile.dart';
import '../../../state/notifiers/player_notifier.dart';

class PlaylistDetailScreen extends ConsumerWidget {
  final int playlistId;

  const PlaylistDetailScreen({super.key, required this.playlistId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // In a real app, we'd fetch songs for this playlist from PlaylistRepository
    final songsAsync = ref.watch(allSongsProvider);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.defaultBackgroundDark, Color(0xFF1A1A2E)],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 250,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => context.pop(),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.playlist_play, size: 80, color: Colors.white24),
                      const SizedBox(height: 16),
                      Text("Playlist Name", style: AppTypography.displaySmall(context).copyWith(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
            songsAsync.when(
              data: (songs) {
                // Mock filtering for demonstration
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final song = songs[index];
                      return SongListTile(
                        song: song,
                        onTap: () {
                          ref.read(playerNotifierProvider.notifier).playSong(song, queue: songs);
                        },
                      );
                    },
                    childCount: songs.length > 5 ? 5 : songs.length,
                  ),
                );
              },
              loading: () => const SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
              error: (err, stack) => SliverFillRemaining(child: Center(child: Text('Error: $err'))),
            ),
          ],
        ),
      ),
    );
  }
}
