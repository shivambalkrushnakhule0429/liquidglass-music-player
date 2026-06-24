import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/song_model.dart';
import '../../data/models/album_model.dart';
import '../../data/models/artist_model.dart';
import '../../di/providers.dart';

part 'song_provider.g.dart';

@riverpod
Future<List<SongModel>> allSongs(AllSongsRef ref) async {
  return await ref.watch(audioQueryRepositoryProvider).getAllSongs();
}

@riverpod
Future<List<AlbumModel>> allAlbums(AllAlbumsRef ref) async {
  return await ref.watch(audioQueryRepositoryProvider).getAllAlbums();
}

@riverpod
Future<List<ArtistModel>> allArtists(AllArtistsRef ref) async {
  return await ref.watch(audioQueryRepositoryProvider).getAllArtists();
}
