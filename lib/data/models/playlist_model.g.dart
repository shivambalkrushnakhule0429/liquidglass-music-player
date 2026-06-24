// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlaylistModelAdapter extends TypeAdapter<PlaylistModel> {
  @override
  final int typeId = 0;

  @override
  PlaylistModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlaylistModel(
      id: fields[0] as int,
      name: fields[1] as String,
      description: fields[2] as String?,
      artwork: fields[3] as Uint8List?,
      songIds: (fields[4] as List).cast<int>(),
      createdAt: fields[5] as DateTime,
      updatedAt: fields[6] as DateTime,
      songCount: fields[7] as int,
      totalDuration: fields[8] as Duration,
    );
  }

  @override
  void write(BinaryWriter writer, PlaylistModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.artwork)
      ..writeByte(4)
      ..write(obj.songIds)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt)
      ..writeByte(7)
      ..write(obj.songCount)
      ..writeByte(8)
      ..write(obj.totalDuration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaylistModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PlaylistModelImplAdapter extends TypeAdapter<_$PlaylistModelImpl> {
  @override
  final int typeId = 0;

  @override
  _$PlaylistModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$PlaylistModelImpl(
      id: fields[0] as int,
      name: fields[1] as String,
      description: fields[2] as String?,
      artwork: fields[3] as Uint8List?,
      songIds: (fields[4] as List).cast<int>(),
      createdAt: fields[5] as DateTime,
      updatedAt: fields[6] as DateTime,
      songCount: fields[7] as int,
      totalDuration: fields[8] as Duration,
    );
  }

  @override
  void write(BinaryWriter writer, _$PlaylistModelImpl obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.artwork)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt)
      ..writeByte(7)
      ..write(obj.songCount)
      ..writeByte(8)
      ..write(obj.totalDuration)
      ..writeByte(4)
      ..write(obj.songIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaylistModelImplAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaylistModelImpl _$$PlaylistModelImplFromJson(Map<String, dynamic> json) =>
    _$PlaylistModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      songIds: (json['songIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      songCount: (json['songCount'] as num?)?.toInt() ?? 0,
      totalDuration: json['totalDuration'] == null
          ? Duration.zero
          : Duration(microseconds: (json['totalDuration'] as num).toInt()),
    );

Map<String, dynamic> _$$PlaylistModelImplToJson(_$PlaylistModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'songIds': instance.songIds,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'songCount': instance.songCount,
      'totalDuration': instance.totalDuration.inMicroseconds,
    };
