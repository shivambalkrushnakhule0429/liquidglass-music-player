import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/playlist_model.dart';
import '../../di/providers.dart';

part 'playlist_provider.g.dart';

@riverpod
Future<List<PlaylistModel>> playlists(PlaylistsRef ref) async {
  return await ref.watch(playlistRepositoryProvider).getAllPlaylists();
}
