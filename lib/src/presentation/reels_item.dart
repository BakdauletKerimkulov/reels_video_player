import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_reels/src/application/reels_cache_service.dart';
import 'package:video_player_reels/src/domain/reels.dart';

class ReelsItem extends ConsumerStatefulWidget {
  const ReelsItem(this.reelsItem, {super.key});
  final Reels reelsItem;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReelsItemState();
}

class _ReelsItemState extends ConsumerState<ReelsItem> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(getControllerProvider(widget.reelsItem.id));

    debugPrint(controller == null ? 'controller null' : controller.toString());

    return controller != null && controller.value.isInitialized
        ? GestureDetector(
            onTap: () {
              controller.value.isPlaying
                  ? controller.pause()
                  : controller.play();
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: VideoPlayer(controller),
                ),
              ],
            ),
          )
        : Center(child: const CircularProgressIndicator());
  }
}
