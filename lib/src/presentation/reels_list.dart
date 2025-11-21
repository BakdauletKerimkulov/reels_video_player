import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player_reels/src/application/reels_cache_service.dart';
import 'package:video_player_reels/src/data/reels_repository.dart';
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

  @override
  Widget build(BuildContext context) {
    final reelsAsync = ref.watch(reelsListStreamProvider);
    return reelsAsync.when(
      data: (reels) {
        if (reels.isEmpty) {
          return Center(child: Text('No reels'));
        }

        final urls = reels.map((r) => r.url).toList();

        // Предзагружаем при первой загрузке
        ref.listenManual(activeIndexProvider, (previous, next) {
          if (previous == null || previous != next) {
            // Предзагружаем вокруг нового индекса
            ref.read(reelsCacheServiceProvider.notifier).preload(next, urls);

            // Останавливаем предыдущее видео
            if (previous != null) {
              final prevController = ref.read(getControllerProvider(previous));
              prevController
                ?..pause()
                ..seekTo(Duration.zero);
            }
          }
        });

        // Инициализация: предзагрузка при первом рендере
        if (ref.read(activeIndexProvider) == 0) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.read(reelsCacheServiceProvider.notifier).preload(0, urls);
          });
        }

        return PageView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          controller: _controller,
          itemCount: reels.length,
          onPageChanged: (index) {
            ref.read(activeIndexProvider.notifier).setIndex(index);
          },
          itemBuilder: (context, index) {
            final reelsItem = reels[index];
            final controller = ref.watch(getControllerProvider(index));
            return ReelsItem(
              playerController: controller,
              reelsItem: reelsItem,
              index: index,
            );
          },
        );
      },
      error: (e, st) => Center(child: Text(e.toString())),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
