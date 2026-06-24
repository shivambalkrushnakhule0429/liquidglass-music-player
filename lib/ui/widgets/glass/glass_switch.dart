import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class GlassSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const GlassSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: onChanged,
      activeColor: AppColors.primaryAccent,
      activeTrackColor: AppColors.primaryAccent.withOpacity(0.5),
    );
  }
}
