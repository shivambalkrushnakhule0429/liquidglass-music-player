import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_model.freezed.dart';
part 'song_model.g.dart';

@freezed
class SongModel with _$SongModel {
  const factory SongModel({
    required int id,
    required String title,
    required String artist,
    required String album,
    required int albumId,
    required int artistId,
    required Duration duration,
    required String uri,
    required int fileSize,
    String? artworkUri,
    int? year,
    int? trackNumber,
    String? genre,
    int? bitrate,
  }) = _SongModel;

  factory SongModel.fromJson(Map<String, dynamic> json) => _$SongModelFromJson(json);
}
