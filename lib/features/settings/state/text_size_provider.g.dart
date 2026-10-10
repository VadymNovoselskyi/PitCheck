// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_size_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(textSizeStore)
final textSizeStoreProvider = TextSizeStoreProvider._();

final class TextSizeStoreProvider
    extends $FunctionalProvider<TextSizeStore, TextSizeStore, TextSizeStore>
    with $Provider<TextSizeStore> {
  TextSizeStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'textSizeStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$textSizeStoreHash();

  @$internal
  @override
  $ProviderElement<TextSizeStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TextSizeStore create(Ref ref) {
    return textSizeStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextSizeStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextSizeStore>(value),
    );
  }
}

String _$textSizeStoreHash() => r'bed2b84643f173593a3285c02f3c907a4b157497';

@ProviderFor(initialTextSize)
final initialTextSizeProvider = InitialTextSizeProvider._();

final class InitialTextSizeProvider
    extends $FunctionalProvider<TextSize, TextSize, TextSize>
    with $Provider<TextSize> {
  InitialTextSizeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'initialTextSizeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$initialTextSizeHash();

  @$internal
  @override
  $ProviderElement<TextSize> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TextSize create(Ref ref) {
    return initialTextSize(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextSize value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextSize>(value),
    );
  }
}

String _$initialTextSizeHash() => r'df7bf6d9c37bdb06de054220f991b9e1b260746b';

@ProviderFor(TextSizeController)
final textSizeControllerProvider = TextSizeControllerProvider._();

final class TextSizeControllerProvider
    extends $NotifierProvider<TextSizeController, TextSize> {
  TextSizeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'textSizeControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$textSizeControllerHash();

  @$internal
  @override
  TextSizeController create() => TextSizeController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TextSize value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TextSize>(value),
    );
  }
}

String _$textSizeControllerHash() =>
    r'1a85ff51c0aa4850e7906cff858535df5fc4d7af';

abstract class _$TextSizeController extends $Notifier<TextSize> {
  TextSize build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<TextSize, TextSize>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TextSize, TextSize>,
              TextSize,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
