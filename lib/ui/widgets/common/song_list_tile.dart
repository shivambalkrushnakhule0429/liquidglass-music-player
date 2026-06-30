import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart' hide SongModel;
import '../../../core/constants/app_typography.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/glass_constants.dart';
import '../../../data/models/song_model.dart';
import '../glass/glass_panel.dart';

class SongListTile extends StatelessWidget {
  final SongModel song;
  final VoidCallback onTap;
  final VoidCallback? onMoreTap;
  final bool isPlaying;

  const SongListTile({
    super.key,
    required this.song,
    required this.onTap,
    this.onMoreTap,
    this.isPlaying = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: GlassPanel(
        onTap: onTap,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        borderRadius: GlassConstants.radiusMedium,
        opacity: isPlaying ? GlassConstants.opacityStrong : GlassConstants.opacityLight,
        borderColor: isPlaying ? AppColors.primaryAccent.withValues(alpha: (0.5)) : null,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: QueryArtworkWidget(
                id: song.id,
                type: ArtworkType.AUDIO,
                nullArtworkWidget: Container(
                  width: 48,
                  height: 48,
                  color: Colors.white.withValues(alpha: (0.1)),
                  child: isPlaying
                    ? const Icon(Icons.equalizer, color: AppColors.primaryAccent)
                    : const Icon(Icons.music_note, color: Colors.white70),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.title,
                    style: AppTypography.bodyLarge(context).copyWith(
                      color: isPlaying ? AppColors.primaryAccent : AppColors.textOnGlassLight,
                      fontWeight: isPlaying ? FontWeight.bold : FontWeight.normal,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${song.artist} • ${song.album}',
                    style: AppTypography.bodySmall(context).copyWith(color: AppColors.textOnGlassSubtle),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              _formatDuration(song.duration),
              style: AppTypography.bodySmall(context).copyWith(color: AppColors.textOnGlassMuted),
            ),
            if (onMoreTap != null)
              IconButton(
                icon: const Icon(Icons.more_vert, color: AppColors.textOnGlassSubtle, size: 20),
                onPressed: onMoreTap,
              ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${duration.inHours > 0 ? '${duration.inHours}:' : ''}$twoDigitMinutes:$twoDigitSeconds";
  }
}
