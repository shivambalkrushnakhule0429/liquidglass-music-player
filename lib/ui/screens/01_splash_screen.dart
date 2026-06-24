import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../di/providers.dart';
import '../widgets/glass/glass_panel.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    // Simulate initialization
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      final settings = ref.read(settingsRepositoryProvider);
      if (!settings.onboardingCompleted) {
        context.go('/onboarding');
      } else {
        context.go('/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              GlassPanel(
                borderRadius: 24,
                padding: const EdgeInsets.all(24),
                child: const Icon(Icons.blur_on, size: 80, color: Colors.white),
              ),
              const SizedBox(height: 24),
              Text(
                'AURA',
                style: AppTypography.displayLarge(context).copyWith(color: Colors.white),
              ),
              Text(
                'Feel Your Music',
                style: AppTypography.bodyMedium(context).copyWith(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
