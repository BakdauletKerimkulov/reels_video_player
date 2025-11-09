import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player_reels/src/application/reels_cache_service.dart';
import 'package:video_player_reels/src/data/reels_repository.dart';
import 'package:video_player_reels/src/domain/reels.dart';
import 'package:video_player_reels/src/presentation/reels_item.dart';

class ReelsList extends ConsumerStatefulWidget {
  const ReelsList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReelsListState();
}

class _ReelsListState extends ConsumerState<ReelsList> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPageChanged(int newIndex, List<Reels> reels) {
    final cacheService = ref.read(reelsCacheServiceProvider.notifier);

    final currentReelsId = reels[newIndex].id;
    final previousReelsId = reels[newIndex - 1].id;

    cacheService.getController(previousReelsId)?.pause();

    cacheService.getController(currentReelsId)?.play();

    cacheService.preload(newIndex, reels);
  }

  @override
  Widget build(BuildContext context) {
    final reelsAsync = ref.watch(reelsListStreamProvider);
    return reelsAsync.when(
      data: (reels) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (reels.isNotEmpty) {
            ref.read(reelsCacheServiceProvider.notifier).preload(0, reels);
          }
        });

        return PageView.builder(
          scrollDirection: Axis.vertical,
          controller: _controller,
          onPageChanged: (index) {
            _onPageChanged(index, reels);
          },
          itemBuilder: (context, index) {
            final reelsItem = reels[index];
            return ReelsItem(reelsItem);
          },
        );
      },
      error: (e, st) => Center(child: Text(e.toString())),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
