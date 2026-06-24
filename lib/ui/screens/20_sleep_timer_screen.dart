import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../widgets/glass/glass_panel.dart';
import '../widgets/glass/glass_button.dart';

class SleepTimerScreen extends StatelessWidget {
  const SleepTimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sleep Timer", style: TextStyle(color: Colors.white)), backgroundColor: Colors.transparent),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.defaultBackgroundDark, Color(0xFF1A1A2E)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("15:00", style: TextStyle(color: Colors.white, fontSize: 64, fontWeight: FontWeight.bold)),
              const Text("minutes", style: TextStyle(color: Colors.white60)),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   _buildPreset("5m"),
                   _buildPreset("15m"),
                   _buildPreset("30m"),
                   _buildPreset("1h"),
                ],
              ),
              const SizedBox(height: 48),
              GlassButton(onTap: () => Navigator.pop(context), child: const Text("Start Timer", style: TextStyle(color: Colors.white))),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPreset(String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: GlassPanel(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        borderRadius: 16,
        child: Text(label, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
