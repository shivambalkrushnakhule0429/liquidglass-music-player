import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../state/providers/song_provider.dart';
import '../widgets/common/song_list_tile.dart';
import '../widgets/common/album_card.dart';
import '../../../state/notifiers/player_notifier.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final songsAsync = ref.watch(allSongsProvider);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.defaultBackgroundDark, Color(0xFF1A1A2E)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => context.pop(),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextField(
                          controller: _searchController,
                          style: const TextStyle(color: Colors.white),
                          onChanged: (val) => setState(() => _query = val),
                          decoration: const InputDecoration(
                            hintText: "Search music...",
                            hintStyle: TextStyle(color: Colors.white60),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _query.isEmpty
                  ? const Center(child: Text("Search for songs, albums, or artists", style: TextStyle(color: Colors.white60)))
                  : songsAsync.when(
                      data: (songs) {
                        final filtered = songs.where((s) =>
                          s.title.toLowerCase().contains(_query.toLowerCase()) ||
                          s.artist.toLowerCase().contains(_query.toLowerCase())
                        ).toList();

                        return ListView.builder(
                          itemCount: filtered.length,
                          itemBuilder: (context, index) {
                            final song = filtered[index];
                            return SongListTile(
                              song: song,
                              onTap: () => ref.read(playerNotifierProvider.notifier).playSong(song, queue: filtered),
                            );
                          },
                        );
                      },
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (err, s) => Center(child: Text("Error: $err")),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
