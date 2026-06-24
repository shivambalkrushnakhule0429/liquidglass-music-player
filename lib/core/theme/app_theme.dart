import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/glass_constants.dart';
import 'glass_theme_extension.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryAccent,
        brightness: Brightness.light,
      ),
      extensions: [
        GlassThemeExtension(
          blurLevel: GlassConstants.blurMedium,
          opacity: GlassConstants.opacityMedium,
          borderColor: GlassConstants.lightBorder,
          highlightColor: GlassConstants.lightHighlight,
        ),
      ],
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryAccent,
        brightness: Brightness.dark,
        background: AppColors.defaultBackgroundDark,
      ),
      scaffoldBackgroundColor: AppColors.defaultBackgroundDark,
      extensions: [
        GlassThemeExtension(
          blurLevel: GlassConstants.blurMedium,
          opacity: GlassConstants.opacityMedium,
          borderColor: GlassConstants.darkBorder,
          highlightColor: GlassConstants.darkHighlight,
        ),
      ],
    );
  }
}
