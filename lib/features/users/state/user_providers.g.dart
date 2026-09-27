// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authUser)
final authUserProvider = AuthUserProvider._();

final class AuthUserProvider
    extends
        $FunctionalProvider<
          AsyncValue<firebase_auth.User?>,
          firebase_auth.User?,
          Stream<firebase_auth.User?>
        >
    with
        $FutureModifier<firebase_auth.User?>,
        $StreamProvider<firebase_auth.User?> {
  AuthUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authUserProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authUserHash();

  @$internal
  @override
  $StreamProviderElement<firebase_auth.User?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<firebase_auth.User?> create(Ref ref) {
    return authUser(ref);
  }
}

String _$authUserHash() => r'8bca33bc43c3e79959985083f29cb05ea27257b5';

@ProviderFor(appUser)
final appUserProvider = AppUserProvider._();

final class AppUserProvider
    extends
        $FunctionalProvider<AsyncValue<AppUser?>, AppUser?, FutureOr<AppUser?>>
    with $FutureModifier<AppUser?>, $FutureProvider<AppUser?> {
  AppUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appUserProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appUserHash();

  @$internal
  @override
  $FutureProviderElement<AppUser?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<AppUser?> create(Ref ref) {
    return appUser(ref);
  }
}

String _$appUserHash() => r'01e3e1648efcb0d382edb20de25ed5f1db1b46b5';

@ProviderFor(currentUser)
final currentUserProvider = CurrentUserProvider._();

final class CurrentUserProvider
    extends $FunctionalProvider<AppUser, AppUser, AppUser>
    with $Provider<AppUser> {
  CurrentUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserHash();

  @$internal
  @override
  $ProviderElement<AppUser> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppUser create(Ref ref) {
    return currentUser(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppUser value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppUser>(value),
    );
  }
}

String _$currentUserHash() => r'22f6680f0a5faa3fb17ae4ccd5abd00815f8445f';
