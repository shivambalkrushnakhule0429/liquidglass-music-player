import 'package:flutter/material.dart';

class AppColors {
  // Base background (behind all glass) — dynamic, changes with album art
  static const Color defaultBackgroundDark = Color(0xFF0A0A0F);
  static const Color defaultBackgroundLight = Color(0xFFF0F0F5);

  // Accent colors (extracted from album art, fallback to these)
  static const Color primaryAccent = Color(0xFF6C5CE7);
  static const Color secondaryAccent = Color(0xFFA29BFE);
  static const Color tertiaryAccent = Color(0xFF74B9FF);

  // Text on glass
  static const Color textOnGlassLight = Color(0xDDFFFFFF);   // 87% white
  static const Color textOnGlassSubtle = Color(0x99FFFFFF);  // 60% white
  static const Color textOnGlassMuted = Color(0x66FFFFFF);   // 40% white

  // Light theme text on glass
  static const Color textOnGlassLightTheme = Color(0xDD000000);
  static const Color textOnGlassSubtleLight = Color(0x99000000);
  static const Color textOnGlassMutedLight = Color(0x66000000);

  // Interactive states
  static const Color activeHighlight = Color(0x30FFFFFF);    // Active tab
  static const Color inactiveState = Color(0x10FFFFFF);      // Inactive

  // Error / Warning
  static const Color error = Color(0xFFFF6B6B);
  static const Color warning = Color(0xFFFFEAA7);
  static const Color success = Color(0xFF55EFC4);

  // Visualizer colors (gradient)
  static const List<Color> visualizerGradient = [
    Color(0xFF6C5CE7),
    Color(0xFFA29BFE),
    Color(0xFF74B9FF),
    Color(0xFF55EFC4),
  ];
}
