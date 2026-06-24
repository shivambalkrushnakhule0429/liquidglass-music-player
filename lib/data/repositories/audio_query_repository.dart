import 'dart:typed_data';
import 'package:on_audio_query/on_audio_query.dart' as query;
import '../models/song_model.dart' as model;
import '../models/album_model.dart' as model;
import '../models/artist_model.dart' as model;

class AudioQueryRepository {
  final query.OnAudioQuery _audioQuery = query.OnAudioQuery();

  Future<bool> requestPermissions() async {
    return await _audioQuery.permissionsRequest();
  }

  Future<bool> hasPermissions() async {
    return await _audioQuery.permissionsStatus();
  }

  Future<List<model.SongModel>> getAllSongs({query.SongSortType sort = query.SongSortType.TITLE}) async {
    final songs = await _audioQuery.querySongs(
      sortType: sort,
      orderType: query.OrderType.ASC_OR_SMALLER,
      uriType: query.UriType.EXTERNAL,
      ignoreCase: true,
    );
    return songs
        .where((song) => (song.duration ?? 0) > 30000)
        .map((e) => _toSongModelFromPackage(e))
        .toList();
  }

  Future<List<model.AlbumModel>> getAllAlbums() async {
    final albums = await _audioQuery.queryAlbums();
    return albums.map((e) => _toAlbumModel(e)).toList();
  }

  Future<List<model.ArtistModel>> getAllArtists() async {
    final artists = await _audioQuery.queryArtists();
    return artists.map((e) => _toArtistModel(e)).toList();
  }

  Future<List<model.SongModel>> getSongsForAlbum(int albumId) async {
    final songs = await _audioQuery.queryAudiosFrom(
      query.AudiosFromType.ALBUM_ID,
      albumId,
    );
    return songs.map((e) => _toSongModelFromPackage(e)).toList();
  }

  Future<List<model.SongModel>> getSongsForArtist(int artistId) async {
    final songs = await _audioQuery.queryAudiosFrom(
      query.AudiosFromType.ARTIST_ID,
      artistId,
    );
    return songs.map((e) => _toSongModelFromPackage(e)).toList();
  }

  Future<Uint8List?> getAlbumArt(int id, {int quality = 100}) async {
    return await _audioQuery.queryArtwork(id, query.ArtworkType.ALBUM, quality: quality);
  }

  Future<Uint8List?> getSongArtwork(model.SongModel song) async {
    return await _audioQuery.queryArtwork(song.id, query.ArtworkType.AUDIO);
  }

  model.SongModel _toSongModelFromPackage(query.SongModel e) {
    return model.SongModel(
      id: e.id,
      title: e.title,
      artist: e.artist ?? '<Unknown>',
      album: e.album ?? '<Unknown>',
      albumId: e.albumId ?? -1,
      artistId: e.artistId ?? -1,
      duration: Duration(milliseconds: e.duration ?? 0),
      uri: e.uri ?? '',
      fileSize: e.size,
      artworkUri: null,
      year: null,
      trackNumber: e.track,
      genre: e.genre,
      bitrate: null,
    );
  }

  model.AlbumModel _toAlbumModel(query.AlbumModel e) {
    return model.AlbumModel(
      id: e.id,
      album: e.album,
      artist: e.artist ?? '<Unknown>',
      artistId: -1,
      numberOfSongs: e.numOfSongs,
    );
  }

  model.ArtistModel _toArtistModel(query.ArtistModel e) {
    return model.ArtistModel(
      id: e.id,
      artist: e.artist,
      numberOfAlbums: e.numberOfAlbums ?? 0,
      numberOfTracks: e.numberOfTracks ?? 0,
    );
  }
}
