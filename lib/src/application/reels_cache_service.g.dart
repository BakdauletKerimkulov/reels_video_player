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
        $NotifierProvider<ReelsCacheService, Map<int, VideoPlayerController>> {
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
  Override overrideWithValue(Map<int, VideoPlayerController> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<int, VideoPlayerController>>(
        value,
      ),
    );
  }
}

String _$reelsCacheServiceHash() => r'9467f1b282c892c9826b371be7d33c646230afda';

abstract class _$ReelsCacheService
    extends $Notifier<Map<int, VideoPlayerController>> {
  Map<int, VideoPlayerController> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              Map<int, VideoPlayerController>,
              Map<int, VideoPlayerController>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Map<int, VideoPlayerController>,
                Map<int, VideoPlayerController>
              >,
              Map<int, VideoPlayerController>,
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
    required int super.argument,
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
    final argument = this.argument as int;
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

String _$getControllerHash() => r'995b431f4fb50147b2d16d29822da9d458845f26';

final class GetControllerFamily extends $Family
    with $FunctionalFamilyOverride<VideoPlayerController?, int> {
  const GetControllerFamily._()
    : super(
        retry: null,
        name: r'getControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetControllerProvider call(int id) =>
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
