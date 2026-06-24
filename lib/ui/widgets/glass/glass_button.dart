import 'package:flutter/material.dart';
import '../../../core/constants/glass_constants.dart';
import 'glass_panel.dart';

class GlassButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final Color? color;

  const GlassButton({
    super.key,
    required this.child,
    required this.onTap,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      onTap: onTap,
      width: width,
      height: height,
      opacity: GlassConstants.opacitySolid,
      borderRadius: GlassConstants.radiusFull,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Center(child: child),
    );
  }
}
