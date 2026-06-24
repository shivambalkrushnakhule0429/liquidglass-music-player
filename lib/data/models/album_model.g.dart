// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumModelImpl _$$AlbumModelImplFromJson(Map<String, dynamic> json) =>
    _$AlbumModelImpl(
      id: (json['id'] as num).toInt(),
      album: json['album'] as String,
      artist: json['artist'] as String,
      artistId: (json['artistId'] as num).toInt(),
      numberOfSongs: (json['numberOfSongs'] as num).toInt(),
      albumArt: json['albumArt'] as String?,
    );

Map<String, dynamic> _$$AlbumModelImplToJson(_$AlbumModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'album': instance.album,
      'artist': instance.artist,
      'artistId': instance.artistId,
      'numberOfSongs': instance.numberOfSongs,
      'albumArt': instance.albumArt,
    };
