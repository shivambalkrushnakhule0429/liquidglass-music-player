import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'playlist_model.freezed.dart';
part 'playlist_model.g.dart';

@HiveType(typeId: 0)
@freezed
class PlaylistModel with _$PlaylistModel {
  @HiveType(typeId: 0)
  const factory PlaylistModel({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) String? description,
    @HiveField(3) @JsonKey(includeFromJson: false, includeToJson: false) Uint8List? artwork,
    @HiveField(4) @Default([]) List<int> songIds, // Store song IDs, resolve to SongModel at read time
    @HiveField(5) required DateTime createdAt,
    @HiveField(6) required DateTime updatedAt,
    @HiveField(7) @Default(0) int songCount,
    @HiveField(8) @Default(Duration.zero) Duration totalDuration,
  }) = _PlaylistModel;

  factory PlaylistModel.fromJson(Map<String, dynamic> json) => _$PlaylistModelFromJson(json);
}
