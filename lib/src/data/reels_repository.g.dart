// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reels_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(reelsRepository)
const reelsRepositoryProvider = ReelsRepositoryProvider._();

final class ReelsRepositoryProvider
    extends
        $FunctionalProvider<ReelsRepository, ReelsRepository, ReelsRepository>
    with $Provider<ReelsRepository> {
  const ReelsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reelsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reelsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ReelsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ReelsRepository create(Ref ref) {
    return reelsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReelsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReelsRepository>(value),
    );
  }
}

String _$reelsRepositoryHash() => r'd6804bc62327699c8b88015b0e7a662fb3182a3b';

@ProviderFor(reelsListStream)
const reelsListStreamProvider = ReelsListStreamProvider._();

final class ReelsListStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Reels>>,
          List<Reels>,
          Stream<List<Reels>>
        >
    with $FutureModifier<List<Reels>>, $StreamProvider<List<Reels>> {
  const ReelsListStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reelsListStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reelsListStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<Reels>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Reels>> create(Ref ref) {
    return reelsListStream(ref);
  }
}

String _$reelsListStreamHash() => r'1d275d01d079f178b235d808e2490fb2a42d7e78';
