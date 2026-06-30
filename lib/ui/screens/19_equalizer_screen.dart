import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../widgets/glass/glass_panel.dart';
import '../widgets/glass/glass_slider.dart';
import '../../state/notifiers/equalizer_notifier.dart';

class EqualizerScreen extends ConsumerWidget {
  const EqualizerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eqState = ref.watch(equalizerNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Equalizer", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.defaultBackgroundDark, Color(0xFF1A1A2E)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(5, (index) => _buildEQBand(ref, index, eqState.bandLevels[index])),
              ),
              const SizedBox(height: 48),
              _buildSliderSetting(
                "Bass Boost",
                eqState.bassBoost,
                (v) => ref.read(equalizerNotifierProvider.notifier).setBassBoost(v),
              ),
              const SizedBox(height: 24),
              _buildSliderSetting(
                "Virtualizer",
                eqState.virtualizer,
                (v) => ref.read(equalizerNotifierProvider.notifier).setVirtualizer(v),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEQBand(WidgetRef ref, int index, double value) {
    return Column(
      children: [
        Container(
          height: 200,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
          ),
          child: RotatedBox(
            quarterTurns: 3,
            child: SliderTheme(
              data: SliderThemeData(
                trackHeight: 40,
                thumbShape: SliderComponentShape.noThumb,
                overlayShape: SliderComponentShape.noOverlay,
                activeTrackColor: AppColors.primaryAccent.withOpacity(0.5),
                inactiveTrackColor: Colors.transparent,
              ),
              child: Slider(
                value: value,
                onChanged: (v) => ref.read(equalizerNotifierProvider.notifier).setBandLevel(index, v),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text("${(index + 1) * 100}Hz", style: const TextStyle(color: Colors.white60, fontSize: 10)),
      ],
    );
  }

  Widget _buildSliderSetting(String label, double value, ValueChanged<double> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        GlassSlider(value: value, onChanged: onChanged),
      ],
    );
  }
}
