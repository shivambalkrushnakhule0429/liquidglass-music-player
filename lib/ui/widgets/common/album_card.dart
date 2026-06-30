import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart' hide AlbumModel;
import '../../../core/constants/app_typography.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/utils/responsive_helpers.dart';
import '../../../data/models/album_model.dart';
import '../glass/glass_panel.dart';

class AlbumCard extends StatelessWidget {
  final AlbumModel album;
  final VoidCallback onTap;

  const AlbumCard({
    super.key,
    required this.album,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final artSize = Responsive.albumArtSize(context, size: ArtSize.small);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: QueryArtworkWidget(
              id: album.id,
              type: ArtworkType.ALBUM,
              artworkWidth: artSize,
              artworkHeight: artSize,
              nullArtworkWidget: GlassPanel(
                width: artSize,
                height: artSize,
                padding: EdgeInsets.zero,
                child: const Center(
                  child: Icon(Icons.album, size: 48, color: Colors.white30),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            album.album,
            style: AppTypography.bodyMedium(context).copyWith(color: AppColors.textOnGlassLight),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            album.artist,
            style: AppTypography.bodySmall(context).copyWith(color: AppColors.textOnGlassSubtle),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
