import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  // Use "Inter" as primary font (Google Fonts)
  // Use "Outfit" as display/heading font (Google Fonts)

  // Responsive font sizes — ALL sizes scale with screen width
  // Base reference: 360px width
  static double _scale(BuildContext context, double base) {
    final width = MediaQuery.of(context).size.width;
    return (base * (width / 360)).clamp(base * 0.8, base * 1.4);
  }

  // Display
  static TextStyle displayLarge(BuildContext context) => GoogleFonts.outfit(
    fontSize: _scale(context, 32),
    fontWeight: FontWeight.bold,
  );

  static TextStyle displayMedium(BuildContext context) => GoogleFonts.outfit(
    fontSize: _scale(context, 26),
    fontWeight: FontWeight.bold,
  );

  static TextStyle displaySmall(BuildContext context) => GoogleFonts.outfit(
    fontSize: _scale(context, 22),
    fontWeight: FontWeight.bold,
  );

  // Body
  static TextStyle bodyLarge(BuildContext context) => GoogleFonts.inter(
    fontSize: _scale(context, 16),
  );

  static TextStyle bodyMedium(BuildContext context) => GoogleFonts.inter(
    fontSize: _scale(context, 14),
  );

  static TextStyle bodySmall(BuildContext context) => GoogleFonts.inter(
    fontSize: _scale(context, 12),
  );

  // Label
  static TextStyle labelLarge(BuildContext context) => GoogleFonts.inter(
    fontSize: _scale(context, 14),
    fontWeight: FontWeight.bold,
  );

  static TextStyle labelMedium(BuildContext context) => GoogleFonts.inter(
    fontSize: _scale(context, 12),
    fontWeight: FontWeight.bold,
  );

  static TextStyle labelSmall(BuildContext context) => GoogleFonts.inter(
    fontSize: _scale(context, 10),
  );

  // ALL text on glass MUST have:
  // - Light theme: slight text shadow for readability
  // - Dark theme: no shadow needed (glass is light-ish)

  static List<Shadow> get textShadow => [
    const Shadow(
      offset: Offset(0, 1),
      blurRadius: 2.0,
      color: Color(0x40000000),
    ),
  ];
}
