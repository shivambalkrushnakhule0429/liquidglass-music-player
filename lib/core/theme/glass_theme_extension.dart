import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/constants/glass_constants.dart';

class GlassThemeExtension extends ThemeExtension<GlassThemeExtension> {
  final double blurLevel;
  final double opacity;
  final Color borderColor;
  final Color highlightColor;

  GlassThemeExtension({
    required this.blurLevel,
    required this.opacity,
    required this.borderColor,
    required this.highlightColor,
  });

  @override
  ThemeExtension<GlassThemeExtension> copyWith({
    double? blurLevel,
    double? opacity,
    Color? borderColor,
    Color? highlightColor,
  }) {
    return GlassThemeExtension(
      blurLevel: blurLevel ?? this.blurLevel,
      opacity: opacity ?? this.opacity,
      borderColor: borderColor ?? this.borderColor,
      highlightColor: highlightColor ?? this.highlightColor,
    );
  }

  @override
  ThemeExtension<GlassThemeExtension> lerp(
    ThemeExtension<GlassThemeExtension>? other,
    double t,
  ) {
    if (other is! GlassThemeExtension) return this;
    return GlassThemeExtension(
      blurLevel: lerpDouble(blurLevel, other.blurLevel, t) ?? blurLevel,
      opacity: lerpDouble(opacity, other.opacity, t) ?? opacity,
      borderColor: Color.lerp(borderColor, other.borderColor, t) ?? borderColor,
      highlightColor: Color.lerp(highlightColor, other.highlightColor, t) ?? highlightColor,
    );
  }
}
