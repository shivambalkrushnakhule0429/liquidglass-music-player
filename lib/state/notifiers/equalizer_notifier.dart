import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../di/providers.dart';

part 'equalizer_notifier.g.dart';

@riverpod
class EqualizerNotifier extends _$EqualizerNotifier {
  @override
  EqualizerState build() {
    return const EqualizerState();
  }

  Future<void> setBandLevel(int index, double level) async {
    final newLevels = List<double>.from(state.bandLevels);
    newLevels[index] = level;
    state = state.copyWith(bandLevels: newLevels);

    // level is 0.0 to 1.0, map to -10dB to +10dB gain
    final gain = (level - 0.5) * 20.0;
    await ref.read(audioPlayerServiceProvider).setEqualizerBand(index, gain);
  }

  void setBassBoost(double level) {
    state = state.copyWith(bassBoost: level);
  }

  void setVirtualizer(double level) {
    state = state.copyWith(virtualizer: level);
  }
}

class EqualizerState {
  final List<double> bandLevels;
  final double bassBoost;
  final double virtualizer;

  const EqualizerState({
    this.bandLevels = const [0.5, 0.5, 0.5, 0.5, 0.5],
    this.bassBoost = 0.5,
    this.virtualizer = 0.5,
  });

  EqualizerState copyWith({
    List<double>? bandLevels,
    double? bassBoost,
    double? virtualizer,
  }) {
    return EqualizerState(
      bandLevels: bandLevels ?? this.bandLevels,
      bassBoost: bassBoost ?? this.bassBoost,
      virtualizer: virtualizer ?? this.virtualizer,
    );
  }
}
