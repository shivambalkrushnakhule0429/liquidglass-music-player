import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../di/providers.dart';
import '../widgets/glass/glass_panel.dart';
import '../widgets/glass/glass_button.dart';

class PermissionScreen extends ConsumerWidget {
  const PermissionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.defaultBackgroundDark, Color(0xFF1A1A2E)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const GlassPanel(
                borderRadius: 100,
                padding: EdgeInsets.all(32),
                child: Icon(Icons.library_music, size: 64, color: Colors.white),
              ),
              const SizedBox(height: 40),
              GlassPanel(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    Text(
                      "Access Your Music",
                      style: AppTypography.displaySmall(context).copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "AURA needs access to your device's audio files to find and play your music.",
                      textAlign: TextAlign.center,
                      style: AppTypography.bodyMedium(context).copyWith(color: Colors.white70),
                    ),
                    const SizedBox(height: 24),
                    _buildPermissionItem("Scan all songs"),
                    _buildPermissionItem("Read album art"),
                    _buildPermissionItem("Access metadata"),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              GlassButton(
                onTap: () async {
                  final granted = await ref.read(audioQueryRepositoryProvider).requestPermissions();
                  if (granted && context.mounted) {
                    context.go('/home');
                  }
                },
                child: const Text("Grant Permission", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPermissionItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle_outline, color: AppColors.success, size: 20),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
