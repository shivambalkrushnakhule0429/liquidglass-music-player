import 'package:flutter/material.dart';
import '../../../core/constants/glass_constants.dart';
import '../../../data/models/song_model.dart';
import '../widgets/glass/glass_panel.dart';

class SongOptionsSheet extends StatelessWidget {
  final SongModel song;

  const SongOptionsSheet({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      blurLevel: GlassConstants.blurHeavy,
      borderRadius: GlassConstants.radiusLarge,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.play_arrow, color: Colors.white),
            title: const Text("Play Next", style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.playlist_add, color: Colors.white),
            title: const Text("Add to Playlist", style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border, color: Colors.white),
            title: const Text("Add to Favorites", style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.share, color: Colors.white),
            title: const Text("Share", style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.delete_outline, color: Colors.redAccent),
            title: const Text("Delete from Device", style: TextStyle(color: Colors.redAccent)),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
