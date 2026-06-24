import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../state/providers/song_provider.dart';
import '../widgets/common/song_list_tile.dart';
import '../../../state/notifiers/player_notifier.dart';

class ArtistDetailScreen extends ConsumerWidget {
  final int artistId;

  const ArtistDetailScreen({super.key, required this.artistId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white10,
                        child: Icon(Icons.person, size: 60, color: Colors.white24),
                      ),
                      const SizedBox(height: 16),
                      Text("Artist Name", style: AppTypography.displaySmall(context).copyWith(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
            songsAsync.when(
              data: (songs) {
                final artistSongs = songs.where((s) => s.artistId == artistId).toList();
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final song = artistSongs[index];
                      return SongListTile(
                        song: song,
                        onTap: () {
                          ref.read(playerNotifierProvider.notifier).playSong(song, queue: artistSongs);
                        },
                      );
                    },
                    childCount: artistSongs.length,
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
