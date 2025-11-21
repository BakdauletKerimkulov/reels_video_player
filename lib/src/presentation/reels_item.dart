// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_reels/src/application/reels_cache_service.dart';
import 'package:video_player_reels/src/domain/reels.dart';

class ReelsItem extends ConsumerWidget {
  const ReelsItem({
    super.key,
    this.playerController,
    required this.reelsItem,
    required this.index,
  });

  final VideoPlayerController? playerController;
  final Reels reelsItem;
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeIndex = ref.watch(activeIndexProvider);
    final VideoPlayerController? controller = playerController;

    // Автозапуск активного видео
    if (controller != null && controller.value.isInitialized) {
      if (activeIndex == index && !controller.value.isPlaying) {
        Future.delayed(Duration(milliseconds: 80), () {
          controller.play();
        });
      } else if (activeIndex != index && controller.value.isPlaying) {
        controller.pause();
      }
    }

    return controller != null && controller.value.isInitialized
        ? ListenableBuilder(
            listenable: controller,
            builder: (context, child) {
              final isPlaying = controller.value.isPlaying;

              return GestureDetector(
                onTap: () => isPlaying ? controller.pause() : controller.play(),
                child: Stack(
                  children: [
                    VideoPlayer(controller),
                    if (!isPlaying)
                      const Center(
                        child: Icon(
                          Icons.play_arrow,
                          size: 80,
                          color: Colors.white54,
                        ),
                      ),
                  ],
                ),
              );
            },
          )
        : Center(child: const CircularProgressIndicator());
  }
}
