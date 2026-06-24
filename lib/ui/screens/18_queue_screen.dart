import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../state/notifiers/player_notifier.dart';
import '../widgets/common/song_list_tile.dart';
import '../widgets/glass/glass_panel.dart';

class QueueScreen extends ConsumerWidget {
  const QueueScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerNotifierProvider);
    final queue = playerState.queue;

    return GlassPanel(
      padding: const EdgeInsets.symmetric(vertical: 20),
      borderRadius: 24,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Up Next", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: queue.length,
              itemBuilder: (context, index) {
                final song = queue[index];
                return SongListTile(
                  song: song,
                  isPlaying: song.id == playerState.currentSong?.id,
                  onTap: () => ref.read(playerNotifierProvider.notifier).playSong(song, queue: queue),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
