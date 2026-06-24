import 'dart:async';
import 'dart:math';

class AudioVisualizerService {
  // Simulated frequency data for now as real FFT requires platform channel
  // or analyzing the actual audio buffer which is complex.

  final _controller = StreamController<List<double>>.broadcast();
  Timer? _timer;

  Stream<List<double>> get frequencyData => _controller.stream;

  void startSimulating() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      final data = List.generate(64, (index) => Random().nextDouble());
      _controller.add(data);
    });
  }

  void stopSimulating() {
    _timer?.cancel();
    _controller.add(List.generate(64, (index) => 0.0));
  }

  void dispose() {
    _timer?.cancel();
    _controller.close();
  }
}
