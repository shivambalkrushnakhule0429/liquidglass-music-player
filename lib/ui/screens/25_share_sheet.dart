import 'package:flutter/material.dart';
import '../../../data/models/song_model.dart';
import '../widgets/glass/glass_panel.dart';

class ShareSheet extends StatelessWidget {
  final SongModel song;

  const ShareSheet({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      borderRadius: 24,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Share", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          _buildShareOption(Icons.description, "Share as Text", () {
            // Share logic
            Navigator.pop(context);
          }),
          _buildShareOption(Icons.audio_file, "Share Audio File", () {
            // Share logic
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }

  Widget _buildShareOption(IconData icon, String label, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white70),
      title: Text(label, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }
}
