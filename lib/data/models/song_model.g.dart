// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SongModelImpl _$$SongModelImplFromJson(Map<String, dynamic> json) =>
    _$SongModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      artist: json['artist'] as String,
      album: json['album'] as String,
      albumId: (json['albumId'] as num).toInt(),
      artistId: (json['artistId'] as num).toInt(),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
      uri: json['uri'] as String,
      fileSize: (json['fileSize'] as num).toInt(),
      artworkUri: json['artworkUri'] as String?,
      year: (json['year'] as num?)?.toInt(),
      trackNumber: (json['trackNumber'] as num?)?.toInt(),
      genre: json['genre'] as String?,
      bitrate: (json['bitrate'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SongModelImplToJson(_$SongModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'artist': instance.artist,
      'album': instance.album,
      'albumId': instance.albumId,
      'artistId': instance.artistId,
      'duration': instance.duration.inMicroseconds,
      'uri': instance.uri,
      'fileSize': instance.fileSize,
      'artworkUri': instance.artworkUri,
      'year': instance.year,
      'trackNumber': instance.trackNumber,
      'genre': instance.genre,
      'bitrate': instance.bitrate,
    };
