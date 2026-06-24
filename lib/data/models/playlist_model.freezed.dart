// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlist_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaylistModel _$PlaylistModelFromJson(Map<String, dynamic> json) {
  return _PlaylistModel.fromJson(json);
}

/// @nodoc
mixin _$PlaylistModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(includeFromJson: false, includeToJson: false)
  Uint8List? get artwork => throw _privateConstructorUsedError;
  @HiveField(4)
  List<int> get songIds =>
      throw _privateConstructorUsedError; // Store song IDs, resolve to SongModel at read time
  @HiveField(5)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(6)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @HiveField(7)
  int get songCount => throw _privateConstructorUsedError;
  @HiveField(8)
  Duration get totalDuration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaylistModelCopyWith<PlaylistModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistModelCopyWith<$Res> {
  factory $PlaylistModelCopyWith(
          PlaylistModel value, $Res Function(PlaylistModel) then) =
      _$PlaylistModelCopyWithImpl<$Res, PlaylistModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) String? description,
      @HiveField(3)
      @JsonKey(includeFromJson: false, includeToJson: false)
      Uint8List? artwork,
      @HiveField(4) List<int> songIds,
      @HiveField(5) DateTime createdAt,
      @HiveField(6) DateTime updatedAt,
      @HiveField(7) int songCount,
      @HiveField(8) Duration totalDuration});
}

/// @nodoc
class _$PlaylistModelCopyWithImpl<$Res, $Val extends PlaylistModel>
    implements $PlaylistModelCopyWith<$Res> {
  _$PlaylistModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? artwork = freezed,
    Object? songIds = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? songCount = null,
    Object? totalDuration = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      artwork: freezed == artwork
          ? _value.artwork
          : artwork // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      songIds: null == songIds
          ? _value.songIds
          : songIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      songCount: null == songCount
          ? _value.songCount
          : songCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaylistModelImplCopyWith<$Res>
    implements $PlaylistModelCopyWith<$Res> {
  factory _$$PlaylistModelImplCopyWith(
          _$PlaylistModelImpl value, $Res Function(_$PlaylistModelImpl) then) =
      __$$PlaylistModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) String? description,
      @HiveField(3)
      @JsonKey(includeFromJson: false, includeToJson: false)
      Uint8List? artwork,
      @HiveField(4) List<int> songIds,
      @HiveField(5) DateTime createdAt,
      @HiveField(6) DateTime updatedAt,
      @HiveField(7) int songCount,
      @HiveField(8) Duration totalDuration});
}

/// @nodoc
class __$$PlaylistModelImplCopyWithImpl<$Res>
    extends _$PlaylistModelCopyWithImpl<$Res, _$PlaylistModelImpl>
    implements _$$PlaylistModelImplCopyWith<$Res> {
  __$$PlaylistModelImplCopyWithImpl(
      _$PlaylistModelImpl _value, $Res Function(_$PlaylistModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? artwork = freezed,
    Object? songIds = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? songCount = null,
    Object? totalDuration = null,
  }) {
    return _then(_$PlaylistModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      artwork: freezed == artwork
          ? _value.artwork
          : artwork // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      songIds: null == songIds
          ? _value._songIds
          : songIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      songCount: null == songCount
          ? _value.songCount
          : songCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0)
class _$PlaylistModelImpl implements _PlaylistModel {
  const _$PlaylistModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) this.description,
      @HiveField(3)
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.artwork,
      @HiveField(4) final List<int> songIds = const [],
      @HiveField(5) required this.createdAt,
      @HiveField(6) required this.updatedAt,
      @HiveField(7) this.songCount = 0,
      @HiveField(8) this.totalDuration = Duration.zero})
      : _songIds = songIds;

  factory _$PlaylistModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaylistModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String? description;
  @override
  @HiveField(3)
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Uint8List? artwork;
  final List<int> _songIds;
  @override
  @JsonKey()
  @HiveField(4)
  List<int> get songIds {
    if (_songIds is EqualUnmodifiableListView) return _songIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_songIds);
  }

// Store song IDs, resolve to SongModel at read time
  @override
  @HiveField(5)
  final DateTime createdAt;
  @override
  @HiveField(6)
  final DateTime updatedAt;
  @override
  @JsonKey()
  @HiveField(7)
  final int songCount;
  @override
  @JsonKey()
  @HiveField(8)
  final Duration totalDuration;

  @override
  String toString() {
    return 'PlaylistModel(id: $id, name: $name, description: $description, artwork: $artwork, songIds: $songIds, createdAt: $createdAt, updatedAt: $updatedAt, songCount: $songCount, totalDuration: $totalDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaylistModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.artwork, artwork) &&
            const DeepCollectionEquality().equals(other._songIds, _songIds) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.songCount, songCount) ||
                other.songCount == songCount) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      const DeepCollectionEquality().hash(artwork),
      const DeepCollectionEquality().hash(_songIds),
      createdAt,
      updatedAt,
      songCount,
      totalDuration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaylistModelImplCopyWith<_$PlaylistModelImpl> get copyWith =>
      __$$PlaylistModelImplCopyWithImpl<_$PlaylistModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaylistModelImplToJson(
      this,
    );
  }
}

abstract class _PlaylistModel implements PlaylistModel {
  const factory _PlaylistModel(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String name,
      @HiveField(2) final String? description,
      @HiveField(3)
      @JsonKey(includeFromJson: false, includeToJson: false)
      final Uint8List? artwork,
      @HiveField(4) final List<int> songIds,
      @HiveField(5) required final DateTime createdAt,
      @HiveField(6) required final DateTime updatedAt,
      @HiveField(7) final int songCount,
      @HiveField(8) final Duration totalDuration}) = _$PlaylistModelImpl;

  factory _PlaylistModel.fromJson(Map<String, dynamic> json) =
      _$PlaylistModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String? get description;
  @override
  @HiveField(3)
  @JsonKey(includeFromJson: false, includeToJson: false)
  Uint8List? get artwork;
  @override
  @HiveField(4)
  List<int> get songIds;
  @override // Store song IDs, resolve to SongModel at read time
  @HiveField(5)
  DateTime get createdAt;
  @override
  @HiveField(6)
  DateTime get updatedAt;
  @override
  @HiveField(7)
  int get songCount;
  @override
  @HiveField(8)
  Duration get totalDuration;
  @override
  @JsonKey(ignore: true)
  _$$PlaylistModelImplCopyWith<_$PlaylistModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
