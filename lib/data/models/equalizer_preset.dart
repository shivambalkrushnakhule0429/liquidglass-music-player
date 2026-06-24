import 'package:freezed_annotation/freezed_annotation.dart';

part 'equalizer_preset.freezed.dart';
part 'equalizer_preset.g.dart';

@freezed
class EqualizerPresetModel with _$EqualizerPresetModel {
  const factory EqualizerPresetModel({
    required String name,
    required List<double> bandLevels,
    @Default(0.0) double bassBoost,
    @Default(0.0) double virtualizer,
  }) = _EqualizerPresetModel;

  factory EqualizerPresetModel.fromJson(Map<String, dynamic> json) => _$EqualizerPresetModelFromJson(json);
}
