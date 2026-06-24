import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ColorExtractionService {
  Future<Color?> extractAccentColor(ImageProvider imageProvider) async {
    try {
      final palette = await PaletteGenerator.fromImageProvider(imageProvider);
      return palette.dominantColor?.color ?? palette.vibrantColor?.color;
    } catch (e) {
      return null;
    }
  }
}
