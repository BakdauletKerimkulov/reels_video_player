// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reels_cache_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReelsCacheService)
const reelsCacheServiceProvider = ReelsCacheServiceProvider._();

final class ReelsCacheServiceProvider
    extends
        $NotifierProvider<
          ReelsCacheService,
          Map<String, VideoPlayerController>
        > {
  const ReelsCacheServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reelsCacheServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reelsCacheServiceHash();

  @$internal
  @override
  ReelsCacheService create() => ReelsCacheService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, VideoPlayerController> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, VideoPlayerController>>(
        value,
      ),
    );
  }
}

String _$reelsCacheServiceHash() => r'93bb586361be1beb6f6f0a04da0125abea24629a';

abstract class _$ReelsCacheService
    extends $Notifier<Map<String, VideoPlayerController>> {
  Map<String, VideoPlayerController> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Map<String, VideoPlayerController>,
              Map<String, VideoPlayerController>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Map<String, VideoPlayerController>,
                Map<String, VideoPlayerController>
              >,
              Map<String, VideoPlayerController>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(getController)
const getControllerProvider = GetControllerFamily._();

final class GetControllerProvider
    extends
        $FunctionalProvider<
          VideoPlayerController?,
          VideoPlayerController?,
          VideoPlayerController?
        >
    with $Provider<VideoPlayerController?> {
  const GetControllerProvider._({
    required GetControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getControllerHash();

  @override
  String toString() {
    return r'getControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<VideoPlayerController?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  VideoPlayerController? create(Ref ref) {
    final argument = this.argument as String;
    return getController(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VideoPlayerController? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VideoPlayerController?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getControllerHash() => r'02864fa9231e06336609c383b2ff36a2613a3646';

final class GetControllerFamily extends $Family
    with $FunctionalFamilyOverride<VideoPlayerController?, String> {
  const GetControllerFamily._()
    : super(
        retry: null,
        name: r'getControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetControllerProvider call(String id) =>
      GetControllerProvider._(argument: id, from: this);

  @override
  String toString() => r'getControllerProvider';
}

@ProviderFor(ActiveIndex)
const activeIndexProvider = ActiveIndexProvider._();

final class ActiveIndexProvider extends $NotifierProvider<ActiveIndex, int> {
  const ActiveIndexProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeIndexProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeIndexHash();

  @$internal
  @override
  ActiveIndex create() => ActiveIndex();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$activeIndexHash() => r'705eadfdd9d0ae3cf60077c36ade26566efbede4';

abstract class _$ActiveIndex extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
