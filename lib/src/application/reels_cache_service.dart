import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

part 'reels_cache_service.g.dart';

@riverpod
class ReelsCacheService extends _$ReelsCacheService {
  @override
  Map<int, VideoPlayerController> build() {
    ref.onDispose(() {
      _disposeAllControllers();
    });
    return {};
  }

  final _loading = <int>{};

  VideoPlayerController? getController(int id) => state[id];

  Future<void> _addController(int id, String url) async {
    if (state.containsKey(id) || _loading.contains(id)) return;
    _loading.add(id);

    try {
      final controller = VideoPlayerController.networkUrl(Uri.parse(url));

      await controller
          .initialize()
          .then((_) {
            controller
              ..setLooping(true)
              ..setVolume(1);
          })
          .onError((e, st) {
            controller.dispose();
          });

      state = {...state, id: controller};
    } catch (e) {
      debugPrint('Error adding controller for $id: ${e.toString()}');
    } finally {
      _loading.remove(id);
    }
  }

  Future<void> preload(int currentIndex, List<String> urls) async {
    // Какие индексы должны быть в кэше
    final neededIds = <int>{
      if (currentIndex - 1 >= 0) currentIndex - 1,
      currentIndex,
      if (currentIndex + 1 < urls.length) currentIndex + 1,
    };

    // 1) Загружаем текущий ролик строго синхронно (await)
    if (neededIds.contains(currentIndex)) {
      await _addController(currentIndex, urls[currentIndex]);
    }

    // 2) Соседей грузим в фоне, без await
    for (final id in neededIds) {
      if (id == currentIndex) continue; // уже загрузили
      _addController(id, urls[id]); // фоновая загрузка
    }

    // 3) Очистка: удаляем контроллеры, которые больше не нужны
    final updated = Map<int, VideoPlayerController>.from(state);
    final removable = state.keys
        .where((id) => !neededIds.contains(id))
        .toList();

    for (final id in removable) {
      updated[id]!.dispose();
      updated.remove(id);
    }

    if (removable.isNotEmpty) {
      state = updated;
    }
  }

  void _disposeAllControllers() {
    for (final c in state.values) {
      c.dispose();
    }
    state = {};
  }
}

@riverpod
VideoPlayerController? getController(Ref ref, int id) {
  final service = ref.watch(reelsCacheServiceProvider);
  return service[id];
}

@riverpod
class ActiveIndex extends _$ActiveIndex {
  @override
  int build() => 0;

  void setIndex(int newIndex) {
    state = newIndex;
  }
}
