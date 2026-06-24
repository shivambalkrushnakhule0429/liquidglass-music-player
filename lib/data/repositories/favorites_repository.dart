import 'package:hive/hive.dart';
import '../models/song_model.dart';

class FavoritesRepository {
  static const String _boxName = 'favorites';
  late Box<int> _box;

  Future<void> init() async {
    _box = await Hive.openBox<int>(_boxName);
  }

  Future<Set<int>> getFavoriteIds() async {
    return _box.values.toSet();
  }

  Future<bool> isFavorite(int songId) async {
    return _box.containsKey(songId);
  }

  Future<void> toggleFavorite(int songId) async {
    if (await isFavorite(songId)) {
      await _box.delete(songId);
    } else {
      await _box.put(songId, songId);
    }
  }

  Future<void> clearAll() async {
    await _box.clear();
  }

  Future<List<SongModel>> getFavoriteSongs(List<SongModel> allSongs) async {
    final favoriteIds = await getFavoriteIds();
    return allSongs.where((song) => favoriteIds.contains(song.id)).toList();
  }
}
