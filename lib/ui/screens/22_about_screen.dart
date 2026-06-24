import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../widgets/glass/glass_panel.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About AURA", style: TextStyle(color: Colors.white)),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const GlassPanel(
                borderRadius: 24,
                padding: EdgeInsets.all(24),
                child: Icon(Icons.blur_on, size: 80, color: Colors.white),
              ),
              const SizedBox(height: 24),
              Text(
                'AURA',
                style: AppTypography.displayLarge(context).copyWith(color: Colors.white),
              ),
              const Text(
                'Version 1.0.0',
                style: TextStyle(color: Colors.white60),
              ),
              const SizedBox(height: 48),
              const Text(
                'Feel Your Music',
                style: TextStyle(color: Colors.white70, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  'A modern music player built with Flutter, featuring a unique Liquid Glass UI design.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
