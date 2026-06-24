import 'package:flutter/material.dart';

enum ScreenSize {
  small,      // width < 360px   (old/compact phones)
  medium,     // 360-412px       (standard phones)
  large,      // 413-480px       (large phones)
  extraLarge, // > 480px         (phablets, small tablets)
}

class ScreenSizeClassifier {
  static ScreenSize classify(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 360) return ScreenSize.small;
    if (width <= 412) return ScreenSize.medium;
    if (width <= 480) return ScreenSize.large;
    return ScreenSize.extraLarge;
  }
}
