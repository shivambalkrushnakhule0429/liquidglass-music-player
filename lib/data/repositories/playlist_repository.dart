import 'package:hive/hive.dart';
import '../models/playlist_model.dart';
import '../models/song_model.dart';

class PlaylistRepository {
  static const String _boxName = 'playlists';
  late Box<PlaylistModel> _box;

  Future<void> init() async {
    _box = await Hive.openBox<PlaylistModel>(_boxName);
  }

  Future<List<PlaylistModel>> getAllPlaylists() async {
    return _box.values.toList();
  }

  Future<PlaylistModel> createPlaylist(String name, {String? description}) async {
    final id = DateTime.now().millisecondsSinceEpoch;
    final playlist = PlaylistModel(
      id: id,
      name: name,
      description: description,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    await _box.put(id, playlist);
    return playlist;
  }

  Future<void> updatePlaylist(PlaylistModel playlist) async {
    await _box.put(playlist.id, playlist.copyWith(updatedAt: DateTime.now()));
  }

  Future<void> deletePlaylist(int playlistId) async {
    await _box.delete(playlistId);
  }

  Future<void> addSongToPlaylist(int playlistId, SongModel song) async {
    final playlist = _box.get(playlistId);
    if (playlist != null) {
      final newSongIds = List<int>.from(playlist.songIds);
      if (!newSongIds.contains(song.id)) {
        newSongIds.add(song.id);
        await updatePlaylist(playlist.copyWith(
          songIds: newSongIds,
          songCount: newSongIds.length,
          totalDuration: playlist.totalDuration + song.duration,
        ));
      }
    }
  }

  Future<void> removeSongFromPlaylist(int playlistId, int songId) async {
    final playlist = _box.get(playlistId);
    if (playlist != null) {
       final newSongIds = List<int>.from(playlist.songIds);
       newSongIds.remove(songId);
       await updatePlaylist(playlist.copyWith(
         songIds: newSongIds,
         songCount: newSongIds.length,
         // totalDuration update would require song info, maybe handled elsewhere or simplified
       ));
    }
  }
}
