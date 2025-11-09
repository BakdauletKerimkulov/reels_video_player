import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:video_player_reels/src/domain/reels.dart';

part 'reels_repository.g.dart';

class InMemoryStore<T> {
  InMemoryStore(T initial) : _subject = BehaviorSubject<T>.seeded(initial);

  final BehaviorSubject<T> _subject;

  Stream<T> get stream => _subject.stream;

  T get value => _subject.value;

  set value(T value) => _subject.add(value);

  void close() => _subject.close();
}

class ReelsRepository {
  final _reels = InMemoryStore<List<Reels>>(kTestReels);

  Stream<List<Reels>> watchReels() => _reels.stream;
}

@riverpod
ReelsRepository reelsRepository(Ref ref) => ReelsRepository();

@riverpod
Stream<List<Reels>> reelsListStream(Ref ref) {
  return ref.watch(reelsRepositoryProvider).watchReels();
}
