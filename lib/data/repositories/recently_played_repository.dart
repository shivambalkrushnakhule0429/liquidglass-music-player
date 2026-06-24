import 'package:hive/hive.dart';
import '../models/song_model.dart';

class RecentlyPlayedRepository {
  static const String _boxName = 'recently_played';
  static const int maxRecentItems = 50;
  late Box<int> _box;

  Future<void> init() async {
    _box = await Hive.openBox<int>(_boxName);
  }

  Future<void> addPlayed(int songId) async {
    // Hive keys aren't ordered by insertion, so we might need a List instead
    final currentList = _box.values.toList();
    currentList.remove(songId);
    currentList.insert(0, songId);

    if (currentList.length > maxRecentItems) {
      currentList.removeLast();
    }

    await _box.clear();
    await _box.addAll(currentList);
  }

  Future<List<int>> getRecentIds() async {
    return _box.values.toList();
  }

  Future<void> clearHistory() async {
    await _box.clear();
  }

  Future<List<SongModel>> getRecentSongs(List<SongModel> allSongs) async {
    final recentIds = await getRecentIds();
    final songMap = {for (var song in allSongs) song.id: song};
    return recentIds
        .map((id) => songMap[id])
        .where((song) => song != null)
        .cast<SongModel>()
        .toList();
  }
}
