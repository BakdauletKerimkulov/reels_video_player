import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_reels/src/domain/reels.dart';

part 'reels_cache_service.g.dart';

@riverpod
class ReelsCacheService extends _$ReelsCacheService {
  @override
  Map<String, VideoPlayerController> build() {
    ref.onDispose(() {
      _disposeAllControllers();
    });
    return {};
  }

  VideoPlayerController? getController(String id) => state[id];

  Future<void> initFirstController(String id, String url) async {
    await _addController(id, url);
  }

  Future<void> _addController(String id, String url) async {
    try {
      if (state.keys.contains(id)) return;
      final controller = VideoPlayerController.networkUrl(Uri.parse(url));

      await controller.initialize();

      controller
        ..setLooping(true)
        ..setVolume(1);

      state = {...state, id: controller};
    } catch (e) {
      debugPrint('Error adding controller for $id: ${e.toString()}');
    }
  }

  void preload(int currentIndex, List<Reels> reels) {
    final neededIds = <String>{};

    for (int i = currentIndex - 1; i <= currentIndex + 1; i++) {
      if (i >= 0 && i < reels.length) {
        final reelsItem = reels[i];
        neededIds.add(reelsItem.id);
        _addController(reelsItem.id, reelsItem.url);
      }
    }

    final updatedState = Map<String, VideoPlayerController>.from(state);
    final toRemove = state.keys.where((id) => !neededIds.contains(id)).toList();

    bool changed = false;
    for (final id in toRemove) {
      updatedState[id]!.dispose();
      updatedState.remove(id);
      changed = true;
    }

    if (changed) {
      state = updatedState;
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
VideoPlayerController? getController(Ref ref, String id) {
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
