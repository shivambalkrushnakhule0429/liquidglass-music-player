import 'package:hive/hive.dart';
import '../models/equalizer_preset.dart';

class EqualizerRepository {
  static const String _boxName = 'equalizer_presets';
  late Box<EqualizerPresetModel> _box;

  Future<void> init() async {
    _box = await Hive.openBox<EqualizerPresetModel>(_boxName);
  }

  Future<List<EqualizerPresetModel>> getCustomPresets() async {
    return _box.values.toList();
  }

  Future<void> savePreset(EqualizerPresetModel preset) async {
    await _box.put(preset.name, preset);
  }

  Future<void> deletePreset(String name) async {
    await _box.delete(name);
  }
}
