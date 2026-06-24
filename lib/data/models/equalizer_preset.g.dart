// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equalizer_preset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EqualizerPresetModelImpl _$$EqualizerPresetModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EqualizerPresetModelImpl(
      name: json['name'] as String,
      bandLevels: (json['bandLevels'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      bassBoost: (json['bassBoost'] as num?)?.toDouble() ?? 0.0,
      virtualizer: (json['virtualizer'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$EqualizerPresetModelImplToJson(
        _$EqualizerPresetModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'bandLevels': instance.bandLevels,
      'bassBoost': instance.bassBoost,
      'virtualizer': instance.virtualizer,
    };
