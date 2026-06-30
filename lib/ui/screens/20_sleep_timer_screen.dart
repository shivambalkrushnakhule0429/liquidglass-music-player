import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../widgets/glass/glass_panel.dart';
import '../widgets/glass/glass_button.dart';
import '../../../state/notifiers/player_notifier.dart';

class SleepTimerScreen extends ConsumerStatefulWidget {
  const SleepTimerScreen({super.key});

  @override
  ConsumerState<SleepTimerScreen> createState() => _SleepTimerScreenState();
}

class _SleepTimerScreenState extends ConsumerState<SleepTimerScreen> {
  Timer? _timer;
  int _secondsRemaining = 0;
  bool _isActive = false;

  void _startTimer(int minutes) {
    _timer?.cancel();
    setState(() {
      _secondsRemaining = minutes * 60;
      _isActive = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer?.cancel();
        ref.read(playerNotifierProvider.notifier).pause();
        setState(() {
          _isActive = false;
        });
        if (mounted) {
           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Sleep timer ended. Music paused.")));
        }
      }
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
    setState(() {
      _secondsRemaining = 0;
      _isActive = false;
    });
  }

  String _formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sleep Timer", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.defaultBackgroundDark, Color(0xFF1A1A2E)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _isActive ? _formatTime(_secondsRemaining) : "00:00",
                style: const TextStyle(color: Colors.white, fontSize: 64, fontWeight: FontWeight.bold),
              ),
              const Text("remaining", style: TextStyle(color: Colors.white60)),
              const SizedBox(height: 48),
              if (!_isActive) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildPreset("5m", 5),
                    _buildPreset("15m", 15),
                    _buildPreset("30m", 30),
                    _buildPreset("1h", 60),
                  ],
                ),
              ] else ...[
                 GlassButton(
                   onTap: _cancelTimer,
                   child: const Text("Cancel Timer", style: TextStyle(color: Colors.redAccent)),
                 ),
              ],
              const SizedBox(height: 48),
              if (!_isActive)
                GlassButton(
                  onTap: () {
                    if (_secondsRemaining > 0) _startTimer(_secondsRemaining ~/ 60);
                  },
                  child: const Text("Start Timer", style: TextStyle(color: Colors.white)),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPreset(String label, int minutes) {
    return GestureDetector(
      onTap: () => setState(() => _secondsRemaining = minutes * 60),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: GlassPanel(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          borderRadius: 16,
          borderColor: _secondsRemaining == minutes * 60 ? AppColors.primaryAccent : null,
          child: Text(label, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
