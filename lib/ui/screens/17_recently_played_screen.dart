import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../state/providers/song_provider.dart';
import '../widgets/common/song_list_tile.dart';
import '../../../state/notifiers/player_notifier.dart';

class RecentlyPlayedScreen extends ConsumerWidget {
  const RecentlyPlayedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // In a real app, this would come from RecentlyPlayedRepository
    final songsAsync = ref.watch(allSongsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recently Played", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.defaultBackgroundDark, Color(0xFF1A1A2E)],
          ),
        ),
        child: songsAsync.when(
          data: (songs) {
            return ListView.builder(
              itemCount: songs.length > 10 ? 10 : songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                return SongListTile(
                  song: song,
                  onTap: () {
                    ref.read(playerNotifierProvider.notifier).playSong(song, queue: songs);
                  },
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Center(child: Text('Error: $err')),
        ),
      ),
    );
  }
}
