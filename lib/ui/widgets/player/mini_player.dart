import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/responsive_helpers.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/constants/app_colors.dart';
import '../../../state/notifiers/player_notifier.dart';
import '../../../state/notifiers/player_state.dart';
import '../glass/glass_panel.dart';

class MiniPlayer extends ConsumerWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerNotifierProvider);
    final song = playerState.currentSong;

    if (song == null) return const SizedBox.shrink();

    final height = Responsive.miniPlayerHeight(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: GlassPanel(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                context.push('/now-playing');
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: height - 20,
                  height: height - 20,
                  color: Colors.white10,
                  child: const Icon(Icons.music_note, color: Colors.white70),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.title,
                    style: AppTypography.bodyMedium(context).copyWith(color: AppColors.textOnGlassLight),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    song.artist,
                    style: AppTypography.bodySmall(context).copyWith(color: AppColors.textOnGlassSubtle),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                playerState.playbackState == PlaybackState.playing ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
              ),
              onPressed: () {
                if (playerState.playbackState == PlaybackState.playing) {
                  ref.read(playerNotifierProvider.notifier).pause();
                } else {
                  ref.read(playerNotifierProvider.notifier).resume();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
