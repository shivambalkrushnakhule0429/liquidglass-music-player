import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../widgets/glass/glass_panel.dart';
import '../widgets/glass/glass_switch.dart'; // To be implemented or used standard

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.defaultBackgroundDark, Color(0xFF1A1A2E)],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildSection("Appearance"),
            _buildSettingItem(context, "Theme", "System"),
            _buildSettingItem(context, "Visualizer", "Bars"),
            const SizedBox(height: 24),
            _buildSection("Playback"),
            _buildSettingItem(context, "Gapless Playback", "On"),
            _buildSettingItem(context, "Crossfade", "2.0s"),
            const SizedBox(height: 24),
            _buildSection("About"),
            _buildSettingItem(context, "Version", "1.0.0"),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(color: AppColors.primaryAccent, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _buildSettingItem(BuildContext context, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: GlassPanel(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(color: Colors.white)),
            Text(value, style: const TextStyle(color: Colors.white60)),
          ],
        ),
      ),
    );
  }
}
