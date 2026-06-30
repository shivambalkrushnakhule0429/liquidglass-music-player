import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../../data/models/song_model.dart';
import '../widgets/glass/glass_panel.dart';

class ShareSheet extends StatelessWidget {
  final SongModel song;

  const ShareSheet({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: GlassPanel(
        padding: const EdgeInsets.all(24),
        borderRadius: 24,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Share", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            _buildShareOption(context, Icons.description, "Share as Text", () {
              Share.share('🎵 Now listening to: ${song.title} by ${song.artist} on AURA');
              Navigator.pop(context);
            }),
            _buildShareOption(context, Icons.audio_file, "Share Audio File", () {
              if (song.uri.startsWith('file://')) {
                 Share.shareXFiles([XFile(song.uri.replaceFirst('file://', ''))], text: song.title);
              } else {
                 Share.share(song.uri, subject: song.title);
              }
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildShareOption(BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(label, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }
}
