import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class BarVisualizer extends StatelessWidget {
  final List<double> data;

  const BarVisualizer({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BarPainter(data),
      size: Size.infinite,
    );
  }
}

class _BarPainter extends CustomPainter {
  final List<double> data;

  _BarPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: AppColors.visualizerGradient,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final barWidth = size.width / data.length;

    for (int i = 0; i < data.length; i++) {
      final barHeight = data[i] * size.height;
      final rect = Rect.fromLTWH(
        i * barWidth,
        size.height - barHeight,
        barWidth * 0.8,
        barHeight,
      );
      canvas.drawRRect(
        RRect.fromRectAndCorners(rect, topLeft: const Radius.circular(2), topRight: const Radius.circular(2)),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _BarPainter oldDelegate) => true;
}
