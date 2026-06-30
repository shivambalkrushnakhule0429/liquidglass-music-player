import 'package:flutter/material.dart';

class GlassConstants {
  // Blur levels for different layers
  static const double blurLight = 10.0;    // Background glass layers
  static const double blurMedium = 20.0;   // Cards, panels
  static const double blurHeavy = 40.0;    // Modals, bottom sheets
  static const double blurUltra = 60.0;    // Overlay dialogs

  // Opacity levels
  static const double opacityZero = 0;        // Completely Zero
  static const double opacitySubtle = 0.05;   // Barely visible glass
  static const double opacityLight = 0.10;    // Light glass panels
  static const double opacityMedium = 0.15;   // Standard glass cards
  static const double opacityStrong = 0.25;   // Prominent glass elements
  static const double opacitySolid = 0.40;    // Interactive glass (buttons)

  // Border
  static const double borderWidth = 0.5;
  static const double borderHighlightWidth = 1.0;

  // Border colors
  static const Color lightBorder = Color(0x40FFFFFF);       // 25% white
  static const Color lightHighlight = Color(0x20FFFFFF);    // 12% white (top edge)
  static const Color darkBorder = Color(0x20FFFFFF);        // 12% white
  static const Color darkHighlight = Color(0x10FFFFFF);     // 6% white

  // Border radius scale
  static const double radiusZero = 0;
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 16.0;
  static const double radiusLarge = 24.0;
  static const double radiusXL = 32.0;
  static const double radiusFull = 100.0;   // Pills, circles

  // Shadow
  static const double shadowBlur = 20.0;
  static const double shadowOffset = 4.0;

  // Animation
  static const Duration glassAnimDuration = Duration(milliseconds: 300);
  static const Curve glassAnimCurve = Curves.easeOutCubic;
}
