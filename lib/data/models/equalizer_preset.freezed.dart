// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'equalizer_preset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EqualizerPresetModel _$EqualizerPresetModelFromJson(Map<String, dynamic> json) {
  return _EqualizerPresetModel.fromJson(json);
}

/// @nodoc
mixin _$EqualizerPresetModel {
  String get name => throw _privateConstructorUsedError;
  List<double> get bandLevels => throw _privateConstructorUsedError;
  double get bassBoost => throw _privateConstructorUsedError;
  double get virtualizer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EqualizerPresetModelCopyWith<EqualizerPresetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EqualizerPresetModelCopyWith<$Res> {
  factory $EqualizerPresetModelCopyWith(EqualizerPresetModel value,
          $Res Function(EqualizerPresetModel) then) =
      _$EqualizerPresetModelCopyWithImpl<$Res, EqualizerPresetModel>;
  @useResult
  $Res call(
      {String name,
      List<double> bandLevels,
      double bassBoost,
      double virtualizer});
}

/// @nodoc
class _$EqualizerPresetModelCopyWithImpl<$Res,
        $Val extends EqualizerPresetModel>
    implements $EqualizerPresetModelCopyWith<$Res> {
  _$EqualizerPresetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? bandLevels = null,
    Object? bassBoost = null,
    Object? virtualizer = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bandLevels: null == bandLevels
          ? _value.bandLevels
          : bandLevels // ignore: cast_nullable_to_non_nullable
              as List<double>,
      bassBoost: null == bassBoost
          ? _value.bassBoost
          : bassBoost // ignore: cast_nullable_to_non_nullable
              as double,
      virtualizer: null == virtualizer
          ? _value.virtualizer
          : virtualizer // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EqualizerPresetModelImplCopyWith<$Res>
    implements $EqualizerPresetModelCopyWith<$Res> {
  factory _$$EqualizerPresetModelImplCopyWith(_$EqualizerPresetModelImpl value,
          $Res Function(_$EqualizerPresetModelImpl) then) =
      __$$EqualizerPresetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      List<double> bandLevels,
      double bassBoost,
      double virtualizer});
}

/// @nodoc
class __$$EqualizerPresetModelImplCopyWithImpl<$Res>
    extends _$EqualizerPresetModelCopyWithImpl<$Res, _$EqualizerPresetModelImpl>
    implements _$$EqualizerPresetModelImplCopyWith<$Res> {
  __$$EqualizerPresetModelImplCopyWithImpl(_$EqualizerPresetModelImpl _value,
      $Res Function(_$EqualizerPresetModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? bandLevels = null,
    Object? bassBoost = null,
    Object? virtualizer = null,
  }) {
    return _then(_$EqualizerPresetModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bandLevels: null == bandLevels
          ? _value._bandLevels
          : bandLevels // ignore: cast_nullable_to_non_nullable
              as List<double>,
      bassBoost: null == bassBoost
          ? _value.bassBoost
          : bassBoost // ignore: cast_nullable_to_non_nullable
              as double,
      virtualizer: null == virtualizer
          ? _value.virtualizer
          : virtualizer // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EqualizerPresetModelImpl implements _EqualizerPresetModel {
  const _$EqualizerPresetModelImpl(
      {required this.name,
      required final List<double> bandLevels,
      this.bassBoost = 0.0,
      this.virtualizer = 0.0})
      : _bandLevels = bandLevels;

  factory _$EqualizerPresetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EqualizerPresetModelImplFromJson(json);

  @override
  final String name;
  final List<double> _bandLevels;
  @override
  List<double> get bandLevels {
    if (_bandLevels is EqualUnmodifiableListView) return _bandLevels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bandLevels);
  }

  @override
  @JsonKey()
  final double bassBoost;
  @override
  @JsonKey()
  final double virtualizer;

  @override
  String toString() {
    return 'EqualizerPresetModel(name: $name, bandLevels: $bandLevels, bassBoost: $bassBoost, virtualizer: $virtualizer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EqualizerPresetModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._bandLevels, _bandLevels) &&
            (identical(other.bassBoost, bassBoost) ||
                other.bassBoost == bassBoost) &&
            (identical(other.virtualizer, virtualizer) ||
                other.virtualizer == virtualizer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name,
      const DeepCollectionEquality().hash(_bandLevels), bassBoost, virtualizer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EqualizerPresetModelImplCopyWith<_$EqualizerPresetModelImpl>
      get copyWith =>
          __$$EqualizerPresetModelImplCopyWithImpl<_$EqualizerPresetModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EqualizerPresetModelImplToJson(
      this,
    );
  }
}

abstract class _EqualizerPresetModel implements EqualizerPresetModel {
  const factory _EqualizerPresetModel(
      {required final String name,
      required final List<double> bandLevels,
      final double bassBoost,
      final double virtualizer}) = _$EqualizerPresetModelImpl;

  factory _EqualizerPresetModel.fromJson(Map<String, dynamic> json) =
      _$EqualizerPresetModelImpl.fromJson;

  @override
  String get name;
  @override
  List<double> get bandLevels;
  @override
  double get bassBoost;
  @override
  double get virtualizer;
  @override
  @JsonKey(ignore: true)
  _$$EqualizerPresetModelImplCopyWith<_$EqualizerPresetModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
