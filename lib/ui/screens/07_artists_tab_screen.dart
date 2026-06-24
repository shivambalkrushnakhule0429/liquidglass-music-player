import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../state/providers/song_provider.dart';
import 'package:go_router/go_router.dart';

class ArtistsTabScreen extends ConsumerWidget {
  const ArtistsTabScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artistsAsync = ref.watch(allArtistsProvider);

    return artistsAsync.when(
      data: (artists) => GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemCount: artists.length,
        itemBuilder: (context, index) {
          final artist = artists[index];
          return GestureDetector(
            onTap: () => context.push('/artist/${artist.id}'),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white10,
                  child: Text(
                    artist.artist.substring(0, 1).toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontSize: 32),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  artist.artist,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "${artist.numberOfTracks} songs",
                  style: const TextStyle(color: Colors.white60, fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}
