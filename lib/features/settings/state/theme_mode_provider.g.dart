// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_mode_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(themeModeStore)
final themeModeStoreProvider = ThemeModeStoreProvider._();

final class ThemeModeStoreProvider
    extends $FunctionalProvider<ThemeModeStore, ThemeModeStore, ThemeModeStore>
    with $Provider<ThemeModeStore> {
  ThemeModeStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeModeStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeModeStoreHash();

  @$internal
  @override
  $ProviderElement<ThemeModeStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemeModeStore create(Ref ref) {
    return themeModeStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeModeStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeModeStore>(value),
    );
  }
}

String _$themeModeStoreHash() => r'a3f8c76e477e6466aba465a5c8d050c23887fd74';

@ProviderFor(initialThemeMode)
final initialThemeModeProvider = InitialThemeModeProvider._();

final class InitialThemeModeProvider
    extends $FunctionalProvider<ThemeMode, ThemeMode, ThemeMode>
    with $Provider<ThemeMode> {
  InitialThemeModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'initialThemeModeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$initialThemeModeHash();

  @$internal
  @override
  $ProviderElement<ThemeMode> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemeMode create(Ref ref) {
    return initialThemeMode(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$initialThemeModeHash() => r'a9ce9fb0a2730c2c03e9ee3f212a8989f6cf4784';

@ProviderFor(ThemeModeController)
final themeModeControllerProvider = ThemeModeControllerProvider._();

final class ThemeModeControllerProvider
    extends $NotifierProvider<ThemeModeController, ThemeMode> {
  ThemeModeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeModeControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeModeControllerHash();

  @$internal
  @override
  ThemeModeController create() => ThemeModeController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$themeModeControllerHash() =>
    r'10d35621d163f23e48caea4440a10553f358a8dd';

abstract class _$ThemeModeController extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeMode, ThemeMode>,
              ThemeMode,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
