import 'package:flutter/material.dart';
import 'screen_size_classifier.dart';

enum ArtSize { thumbnail, small, medium, large, hero }

class Responsive {
  // Breakpoints
  static const double smallBreakpoint = 360;
  static const double mediumBreakpoint = 412;
  static const double largeBreakpoint = 480;

  // Spacing scale per screen size
  static double sp(BuildContext context, double baseSpacing) {
    final size = ScreenSizeClassifier.classify(context);
    switch (size) {
      case ScreenSize.small: return baseSpacing * 0.8;
      case ScreenSize.medium: return baseSpacing * 1.0;
      case ScreenSize.large: return baseSpacing * 1.15;
      case ScreenSize.extraLarge: return baseSpacing * 1.3;
    }
  }

  // Grid columns
  static int gridColumns(BuildContext context) {
    final size = ScreenSizeClassifier.classify(context);
    switch (size) {
      case ScreenSize.small: return 2;
      case ScreenSize.medium: return 2;
      case ScreenSize.large: return 3;
      case ScreenSize.extraLarge: return 4;
    }
  }

  // Album art sizes per screen
  static double albumArtSize(BuildContext context, {required ArtSize size}) {
    final screenSize = ScreenSizeClassifier.classify(context);

    switch (size) {
      case ArtSize.thumbnail:
        switch (screenSize) {
          case ScreenSize.small: return 48;
          case ScreenSize.medium: return 52;
          case ScreenSize.large: return 56;
          case ScreenSize.extraLarge: return 64;
        }
      case ArtSize.small:
        switch (screenSize) {
          case ScreenSize.small: return 120;
          case ScreenSize.medium: return 140;
          case ScreenSize.large: return 160;
          case ScreenSize.extraLarge: return 180;
        }
      case ArtSize.medium:
        switch (screenSize) {
          case ScreenSize.small: return 180;
          case ScreenSize.medium: return 200;
          case ScreenSize.large: return 220;
          case ScreenSize.extraLarge: return 260;
        }
      case ArtSize.large:
        switch (screenSize) {
          case ScreenSize.small: return 260;
          case ScreenSize.medium: return 300;
          case ScreenSize.large: return 340;
          case ScreenSize.extraLarge: return 400;
        }
      case ArtSize.hero:
        return MediaQuery.of(context).size.height * 0.4;
    }
  }

  // Mini player height
  static double miniPlayerHeight(BuildContext context) {
    final size = ScreenSizeClassifier.classify(context);
    switch (size) {
      case ScreenSize.small: return 56;
      case ScreenSize.medium: return 64;
      case ScreenSize.large: return 72;
      case ScreenSize.extraLarge: return 80;
    }
  }

  // Now playing bottom controls area
  static double nowPlayingControlsHeight(BuildContext context) {
    final size = ScreenSizeClassifier.classify(context);
    switch (size) {
      case ScreenSize.small: return 280;
      case ScreenSize.medium: return 320;
      case ScreenSize.large: return 360;
      case ScreenSize.extraLarge: return 400;
    }
  }

  // Glass blur reduction for low-end devices
  static double adaptiveBlur(double baseBlur) {
    // Simplified: check performance tier could be more complex
    // For now we just return baseBlur
    return baseBlur;
  }
}
