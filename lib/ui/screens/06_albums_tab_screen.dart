import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../state/providers/song_provider.dart';
import '../widgets/common/album_card.dart';
import 'package:go_router/go_router.dart';

class AlbumsTabScreen extends ConsumerWidget {
  const AlbumsTabScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumsAsync = ref.watch(allAlbumsProvider);

    return albumsAsync.when(
      data: (albums) => GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: albums.length,
        itemBuilder: (context, index) => AlbumCard(
          album: albums[index],
          onTap: () => context.push('/album/${albums[index].id}'),
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}
