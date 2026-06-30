import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../di/providers.dart';
import '../widgets/glass/glass_panel.dart';
import '../widgets/glass/glass_button.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> _pages = [
    OnboardingData(
      title: "Your Music,\nReimagined",
      description: "AURA detects all music on your device and presents it with stunning glass visuals",
      color: AppColors.primaryAccent,
    ),
    OnboardingData(
      title: "See the\nSound",
      description: "Experience your music with dynamic audio visualizers that react to every beat",
      color: AppColors.secondaryAccent,
    ),
    OnboardingData(
      title: "Your Space,\nYour Rules",
      description: "Customize your listening experience with themes, EQ, and organized playlists",
      color: AppColors.tertiaryAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  _pages[_currentPage].color.withOpacity(0.8),
                  AppColors.defaultBackgroundDark,
                ],
              ),
            ),
          ),
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    GlassPanel(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        children: [
                          Text(
                            _pages[index].title,
                            textAlign: TextAlign.center,
                            style: AppTypography.displayMedium(context).copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            _pages[index].description,
                            textAlign: TextAlign.center,
                            style: AppTypography.bodyMedium(context).copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 60,
            left: 40,
            right: 40,
            child: GlassButton(
              onTap: () {
                if (_currentPage < _pages.length - 1) {
                  _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                } else {
                  ref.read(settingsRepositoryProvider).setOnboardingCompleted(true);
                  context.go('/permission');
                }
              },
              child: Text(
                _currentPage == _pages.length - 1 ? 'Get Started' : 'Next',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingData {
  final String title;
  final String description;
  final Color color;

  OnboardingData({required this.title, required this.description, required this.color});
}
