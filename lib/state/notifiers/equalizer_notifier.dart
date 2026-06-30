import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/equalizer_preset.dart';
import '../../di/providers.dart';

part 'equalizer_notifier.g.dart';

@riverpod
class EqualizerNotifier extends _$EqualizerNotifier {
  @override
  EqualizerState build() {
    return const EqualizerState();
  }

  void setBandLevel(int index, double level) {
    final newLevels = List<double>.from(state.bandLevels);
    newLevels[index] = level;
    state = state.copyWith(bandLevels: newLevels);
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
