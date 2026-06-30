import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/constants/glass_constants.dart';

class GlassPanel extends StatelessWidget {
  final Widget child;
  final double blurLevel;
  final double opacity;
  final double borderRadius;
  final double borderWidth;
  final Color? borderColor;
  final Color? highlightColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final bool enableShadow;
  final VoidCallback? onTap;
  final Clip clipBehavior;

  const GlassPanel({
    super.key,
    required this.child,
    this.blurLevel = GlassConstants.blurMedium,
    this.opacity = GlassConstants.opacityMedium,
    this.borderRadius = GlassConstants.radiusMedium,
    this.borderWidth = GlassConstants.borderWidth,
    this.borderColor,
    this.highlightColor,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.constraints,
    this.enableShadow = true,
    this.onTap,
    this.clipBehavior = Clip.hardEdge,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final effectiveBorderColor = borderColor ??
        (isDark ? GlassConstants.darkBorder : GlassConstants.lightBorder);

    final effectiveHighlightColor = highlightColor ??
        (isDark ? GlassConstants.darkHighlight : GlassConstants.lightHighlight);

    Widget content = Container(
      width: width,
      height: height,
      margin: margin,
      constraints: constraints,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: enableShadow ? [
          BoxShadow(
            blurRadius: GlassConstants.shadowBlur,
            offset: const Offset(0, GlassConstants.shadowOffset),
            color: Colors.black.withValues(alpha: (0.1)),
          )
        ] : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        clipBehavior: clipBehavior,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurLevel, sigmaY: blurLevel),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: effectiveBorderColor,
                width: borderWidth,
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  effectiveHighlightColor.withValues(alpha: (opacity)),
                  Colors.white.withValues(alpha: (opacity * 0.5)),
                ],
              ),
            ),
            child: child,
          ),
        ),
      ),
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: content,
      );
    }

    return content;
  }
}
