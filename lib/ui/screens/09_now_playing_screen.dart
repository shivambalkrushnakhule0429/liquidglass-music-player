import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../core/utils/responsive_helpers.dart';
import '../../../state/notifiers/player_notifier.dart';
import '../../../state/notifiers/player_state.dart';
import '../widgets/glass/glass_panel.dart';
import '../widgets/glass/glass_slider.dart';

class NowPlayingScreen extends ConsumerWidget {
  const NowPlayingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerNotifierProvider);
    final song = playerState.currentSong;

    if (song == null) {
      return const Scaffold(body: Center(child: Text("No song playing")));
    }

    return Scaffold(
      body: Stack(
        children: [
          // Dynamic Background
          AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  playerState.accentColor?.withOpacity(0.4) ?? AppColors.defaultBackgroundDark,
                  AppColors.defaultBackgroundDark,
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  // Top Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 32),
                        onPressed: () => context.pop(),
                      ),
                      Text(
                        "NOW PLAYING",
                        style: AppTypography.labelMedium(context).copyWith(color: Colors.white70, letterSpacing: 2),
                      ),
                      IconButton(
                        icon: const Icon(Icons.queue_music, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Album Art
                  Hero(
                    tag: 'album_art_${song.id}',
                    child: GlassPanel(
                      borderRadius: 24,
                      padding: EdgeInsets.zero,
                      width: Responsive.albumArtSize(context, size: ArtSize.large),
                      height: Responsive.albumArtSize(context, size: ArtSize.large),
                      child: QueryArtworkWidget(
                        id: song.id,
                        type: ArtworkType.AUDIO,
                        artworkWidth: double.infinity,
                        artworkHeight: double.infinity,
                        nullArtworkWidget: const Center(
                          child: Icon(Icons.music_note, size: 100, color: Colors.white24),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Song Info
                  Text(
                    song.title,
                    style: AppTypography.displaySmall(context).copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    song.artist,
                    style: AppTypography.bodyMedium(context).copyWith(color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  // Seek Bar
                  GlassSlider(
                    value: playerState.position.inMilliseconds.toDouble(),
                    max: playerState.duration.inMilliseconds.toDouble() > 0
                        ? playerState.duration.inMilliseconds.toDouble()
                        : 1.0,
                    onChanged: (val) {
                      ref.read(playerNotifierProvider.notifier).seekTo(Duration(milliseconds: val.toInt()));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_formatDuration(playerState.position), style: AppTypography.labelSmall(context).copyWith(color: Colors.white60)),
                        Text(_formatDuration(playerState.duration), style: AppTypography.labelSmall(context).copyWith(color: Colors.white60)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(icon: const Icon(Icons.shuffle, color: Colors.white60), onPressed: () {}),
                      IconButton(icon: const Icon(Icons.skip_previous, color: Colors.white, size: 48), onPressed: () {}),
                      GestureDetector(
                        onTap: () {
                          if (playerState.playbackState == PlaybackState.playing) {
                            ref.read(playerNotifierProvider.notifier).pause();
                          } else {
                            ref.read(playerNotifierProvider.notifier).resume();
                          }
                        },
                        child: GlassPanel(
                          borderRadius: 100,
                          padding: const EdgeInsets.all(20),
                          child: Icon(
                            playerState.playbackState == PlaybackState.playing ? Icons.pause : Icons.play_arrow,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                      ),
                      IconButton(icon: const Icon(Icons.skip_next, color: Colors.white, size: 48), onPressed: () {}),
                      IconButton(icon: const Icon(Icons.repeat, color: Colors.white60), onPressed: () {}),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Volume Slider
                  Row(
                    children: [
                      const Icon(Icons.volume_down, color: Colors.white60, size: 20),
                      Expanded(
                        child: GlassSlider(
                          value: playerState.volume,
                          onChanged: (val) {
                             // Volume control logic
                          },
                        ),
                      ),
                      const Icon(Icons.volume_up, color: Colors.white60, size: 20),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Action Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildActionButton(context, Icons.timer, "Timer"),
                      _buildActionButton(context, Icons.equalizer, "EQ"),
                      _buildActionButton(context, Icons.share, "Share"),
                      _buildActionButton(context, Icons.speed, "1.0x"),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, IconData icon, String label) {
    return Column(
      children: [
        GlassPanel(
          borderRadius: 12,
          padding: const EdgeInsets.all(8),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(height: 4),
        Text(label, style: AppTypography.labelSmall(context).copyWith(color: Colors.white60)),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}
