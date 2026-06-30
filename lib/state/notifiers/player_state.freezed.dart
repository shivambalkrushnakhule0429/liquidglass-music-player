// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlayerState {
  SongModel? get currentSong => throw _privateConstructorUsedError;
  List<SongModel> get queue => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;
  Duration get position => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  PlaybackState get playbackState => throw _privateConstructorUsedError;
  bool get shuffleEnabled => throw _privateConstructorUsedError;
  RepeatMode get repeatMode => throw _privateConstructorUsedError;
  double get volume => throw _privateConstructorUsedError;
  double get previousVolume => throw _privateConstructorUsedError;
  bool get isMuted => throw _privateConstructorUsedError;
  double get speed => throw _privateConstructorUsedError;
  Color? get accentColor => throw _privateConstructorUsedError;
  String? get albumArtUri => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerStateCopyWith<PlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerStateCopyWith<$Res> {
  factory $PlayerStateCopyWith(
          PlayerState value, $Res Function(PlayerState) then) =
      _$PlayerStateCopyWithImpl<$Res, PlayerState>;
  @useResult
  $Res call(
      {SongModel? currentSong,
      List<SongModel> queue,
      int currentIndex,
      Duration position,
      Duration duration,
      PlaybackState playbackState,
      bool shuffleEnabled,
      RepeatMode repeatMode,
      double volume,
      double previousVolume,
      bool isMuted,
      double speed,
      Color? accentColor,
      String? albumArtUri,
      bool isLoading,
      String? errorMessage});

  $SongModelCopyWith<$Res>? get currentSong;
}

/// @nodoc
class _$PlayerStateCopyWithImpl<$Res, $Val extends PlayerState>
    implements $PlayerStateCopyWith<$Res> {
  _$PlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentSong = freezed,
    Object? queue = null,
    Object? currentIndex = null,
    Object? position = null,
    Object? duration = null,
    Object? playbackState = null,
    Object? shuffleEnabled = null,
    Object? repeatMode = null,
    Object? volume = null,
    Object? previousVolume = null,
    Object? isMuted = null,
    Object? speed = null,
    Object? accentColor = freezed,
    Object? albumArtUri = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      currentSong: freezed == currentSong
          ? _value.currentSong
          : currentSong // ignore: cast_nullable_to_non_nullable
              as SongModel?,
      queue: null == queue
          ? _value.queue
          : queue // ignore: cast_nullable_to_non_nullable
              as List<SongModel>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      playbackState: null == playbackState
          ? _value.playbackState
          : playbackState // ignore: cast_nullable_to_non_nullable
              as PlaybackState,
      shuffleEnabled: null == shuffleEnabled
          ? _value.shuffleEnabled
          : shuffleEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      repeatMode: null == repeatMode
          ? _value.repeatMode
          : repeatMode // ignore: cast_nullable_to_non_nullable
              as RepeatMode,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
      previousVolume: null == previousVolume
          ? _value.previousVolume
          : previousVolume // ignore: cast_nullable_to_non_nullable
              as double,
      isMuted: null == isMuted
          ? _value.isMuted
          : isMuted // ignore: cast_nullable_to_non_nullable
              as bool,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      accentColor: freezed == accentColor
          ? _value.accentColor
          : accentColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      albumArtUri: freezed == albumArtUri
          ? _value.albumArtUri
          : albumArtUri // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SongModelCopyWith<$Res>? get currentSong {
    if (_value.currentSong == null) {
      return null;
    }

    return $SongModelCopyWith<$Res>(_value.currentSong!, (value) {
      return _then(_value.copyWith(currentSong: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlayerStateImplCopyWith<$Res>
    implements $PlayerStateCopyWith<$Res> {
  factory _$$PlayerStateImplCopyWith(
          _$PlayerStateImpl value, $Res Function(_$PlayerStateImpl) then) =
      __$$PlayerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SongModel? currentSong,
      List<SongModel> queue,
      int currentIndex,
      Duration position,
      Duration duration,
      PlaybackState playbackState,
      bool shuffleEnabled,
      RepeatMode repeatMode,
      double volume,
      double previousVolume,
      bool isMuted,
      double speed,
      Color? accentColor,
      String? albumArtUri,
      bool isLoading,
      String? errorMessage});

  @override
  $SongModelCopyWith<$Res>? get currentSong;
}

/// @nodoc
class __$$PlayerStateImplCopyWithImpl<$Res>
    extends _$PlayerStateCopyWithImpl<$Res, _$PlayerStateImpl>
    implements _$$PlayerStateImplCopyWith<$Res> {
  __$$PlayerStateImplCopyWithImpl(
      _$PlayerStateImpl _value, $Res Function(_$PlayerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentSong = freezed,
    Object? queue = null,
    Object? currentIndex = null,
    Object? position = null,
    Object? duration = null,
    Object? playbackState = null,
    Object? shuffleEnabled = null,
    Object? repeatMode = null,
    Object? volume = null,
    Object? previousVolume = null,
    Object? isMuted = null,
    Object? speed = null,
    Object? accentColor = freezed,
    Object? albumArtUri = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$PlayerStateImpl(
      currentSong: freezed == currentSong
          ? _value.currentSong
          : currentSong // ignore: cast_nullable_to_non_nullable
              as SongModel?,
      queue: null == queue
          ? _value._queue
          : queue // ignore: cast_nullable_to_non_nullable
              as List<SongModel>,
      currentIndex: null == currentIndex
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      playbackState: null == playbackState
          ? _value.playbackState
          : playbackState // ignore: cast_nullable_to_non_nullable
              as PlaybackState,
      shuffleEnabled: null == shuffleEnabled
          ? _value.shuffleEnabled
          : shuffleEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      repeatMode: null == repeatMode
          ? _value.repeatMode
          : repeatMode // ignore: cast_nullable_to_non_nullable
              as RepeatMode,
      volume: null == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
      previousVolume: null == previousVolume
          ? _value.previousVolume
          : previousVolume // ignore: cast_nullable_to_non_nullable
              as double,
      isMuted: null == isMuted
          ? _value.isMuted
          : isMuted // ignore: cast_nullable_to_non_nullable
              as bool,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      accentColor: freezed == accentColor
          ? _value.accentColor
          : accentColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      albumArtUri: freezed == albumArtUri
          ? _value.albumArtUri
          : albumArtUri // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PlayerStateImpl implements _PlayerState {
  const _$PlayerStateImpl(
      {this.currentSong,
      final List<SongModel> queue = const [],
      this.currentIndex = 0,
      this.position = Duration.zero,
      this.duration = Duration.zero,
      this.playbackState = PlaybackState.idle,
      this.shuffleEnabled = false,
      this.repeatMode = RepeatMode.off,
      this.volume = 1.0,
      this.previousVolume = 1.0,
      this.isMuted = false,
      this.speed = 1.0,
      this.accentColor,
      this.albumArtUri,
      this.isLoading = false,
      this.errorMessage})
      : _queue = queue;

  @override
  final SongModel? currentSong;
  final List<SongModel> _queue;
  @override
  @JsonKey()
  List<SongModel> get queue {
    if (_queue is EqualUnmodifiableListView) return _queue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_queue);
  }

  @override
  @JsonKey()
  final int currentIndex;
  @override
  @JsonKey()
  final Duration position;
  @override
  @JsonKey()
  final Duration duration;
  @override
  @JsonKey()
  final PlaybackState playbackState;
  @override
  @JsonKey()
  final bool shuffleEnabled;
  @override
  @JsonKey()
  final RepeatMode repeatMode;
  @override
  @JsonKey()
  final double volume;
  @override
  @JsonKey()
  final double previousVolume;
  @override
  @JsonKey()
  final bool isMuted;
  @override
  @JsonKey()
  final double speed;
  @override
  final Color? accentColor;
  @override
  final String? albumArtUri;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'PlayerState(currentSong: $currentSong, queue: $queue, currentIndex: $currentIndex, position: $position, duration: $duration, playbackState: $playbackState, shuffleEnabled: $shuffleEnabled, repeatMode: $repeatMode, volume: $volume, previousVolume: $previousVolume, isMuted: $isMuted, speed: $speed, accentColor: $accentColor, albumArtUri: $albumArtUri, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerStateImpl &&
            (identical(other.currentSong, currentSong) ||
                other.currentSong == currentSong) &&
            const DeepCollectionEquality().equals(other._queue, _queue) &&
            (identical(other.currentIndex, currentIndex) ||
                other.currentIndex == currentIndex) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.playbackState, playbackState) ||
                other.playbackState == playbackState) &&
            (identical(other.shuffleEnabled, shuffleEnabled) ||
                other.shuffleEnabled == shuffleEnabled) &&
            (identical(other.repeatMode, repeatMode) ||
                other.repeatMode == repeatMode) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.previousVolume, previousVolume) ||
                other.previousVolume == previousVolume) &&
            (identical(other.isMuted, isMuted) || other.isMuted == isMuted) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.accentColor, accentColor) ||
                other.accentColor == accentColor) &&
            (identical(other.albumArtUri, albumArtUri) ||
                other.albumArtUri == albumArtUri) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentSong,
      const DeepCollectionEquality().hash(_queue),
      currentIndex,
      position,
      duration,
      playbackState,
      shuffleEnabled,
      repeatMode,
      volume,
      previousVolume,
      isMuted,
      speed,
      accentColor,
      albumArtUri,
      isLoading,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerStateImplCopyWith<_$PlayerStateImpl> get copyWith =>
      __$$PlayerStateImplCopyWithImpl<_$PlayerStateImpl>(this, _$identity);
}

abstract class _PlayerState implements PlayerState {
  const factory _PlayerState(
      {final SongModel? currentSong,
      final List<SongModel> queue,
      final int currentIndex,
      final Duration position,
      final Duration duration,
      final PlaybackState playbackState,
      final bool shuffleEnabled,
      final RepeatMode repeatMode,
      final double volume,
      final double previousVolume,
      final bool isMuted,
      final double speed,
      final Color? accentColor,
      final String? albumArtUri,
      final bool isLoading,
      final String? errorMessage}) = _$PlayerStateImpl;

  @override
  SongModel? get currentSong;
  @override
  List<SongModel> get queue;
  @override
  int get currentIndex;
  @override
  Duration get position;
  @override
  Duration get duration;
  @override
  PlaybackState get playbackState;
  @override
  bool get shuffleEnabled;
  @override
  RepeatMode get repeatMode;
  @override
  double get volume;
  @override
  double get previousVolume;
  @override
  bool get isMuted;
  @override
  double get speed;
  @override
  Color? get accentColor;
  @override
  String? get albumArtUri;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$PlayerStateImplCopyWith<_$PlayerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
