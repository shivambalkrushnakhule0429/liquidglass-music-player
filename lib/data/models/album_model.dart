import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_model.freezed.dart';
part 'album_model.g.dart';

@freezed
class AlbumModel with _$AlbumModel {
  const factory AlbumModel({
    required int id,
    required String album,
    required String artist,
    required int artistId,
    required int numberOfSongs,
    String? albumArt,
  }) = _AlbumModel;

  factory AlbumModel.fromJson(Map<String, dynamic> json) => _$AlbumModelFromJson(json);
}
