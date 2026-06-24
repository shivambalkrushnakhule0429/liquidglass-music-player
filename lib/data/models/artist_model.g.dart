// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistModelImpl _$$ArtistModelImplFromJson(Map<String, dynamic> json) =>
    _$ArtistModelImpl(
      id: (json['id'] as num).toInt(),
      artist: json['artist'] as String,
      numberOfAlbums: (json['numberOfAlbums'] as num).toInt(),
      numberOfTracks: (json['numberOfTracks'] as num).toInt(),
    );

Map<String, dynamic> _$$ArtistModelImplToJson(_$ArtistModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'artist': instance.artist,
      'numberOfAlbums': instance.numberOfAlbums,
      'numberOfTracks': instance.numberOfTracks,
    };
