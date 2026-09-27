import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:pit_check/features/users/models/user.dart';
import 'package:pit_check/features/users/repository/app_user_repository.dart';
import 'package:pit_check/features/users/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_providers.g.dart';

final authRepository = AuthRepository();
final appUserRepository = AppUserRepository();

@Riverpod(keepAlive: true)
Stream<firebase_auth.User?> authUser(Ref ref) {
  return authRepository.authStateChanges();
}

@Riverpod(keepAlive: true)
FutureOr<AppUser?> appUser(Ref ref) {
  final firebaseUser = ref
      .watch(authUserProvider)
      .unwrapPrevious() // Don't reuse the old account while a new state loads.
      .requireValue;

  if (firebaseUser == null) return null; // Resolved: signed out.

  return appUserRepository.getOrCreate(firebaseUser);
}

@Riverpod(keepAlive: true)
AppUser currentUser(Ref ref) {
  final result = ref.watch(appUserProvider).unwrapPrevious();

  if (result.isLoading || result.hasError || !result.hasValue) {
    throw StateError('The app user is not ready');
  }
  return result.requireValue!;
}
