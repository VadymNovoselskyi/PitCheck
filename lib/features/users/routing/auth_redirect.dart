import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pit_check/features/users/models/user.dart';

/// Sends users to the route for their auth state, preserving their destination.
String? authRedirect(AsyncValue<AppUser?> user, Uri location) {
  final auth = user.unwrapPrevious();
  String? authPath;

  if (auth.isLoading) {
    authPath = '/loading';
  } else if (auth.hasError) {
    authPath = '/account-error';
  } else if (auth.requireValue == null) {
    authPath = '/login';
  }

  if (authPath == null) {
    return _isAuthRoute(location.path) ? _target(location) : null;
  }
  if (authPath == '/login' && _isLoginRoute(location.path)) return null;
  if (location.path == authPath) return null;

  // Save the requested page so the user can return to it after authentication.
  return Uri(
    path: authPath,
    queryParameters: {'from': _target(location)},
  ).toString();
}

/// Returns a safe local destination, falling back to the home route.
String _target(Uri location) {
  final candidate = _isAuthRoute(location.path)
      ? location.queryParameters['from']
      : location.toString();

  // Reject nonlocal targets before using them as a redirect destination.
  if (candidate == null ||
      !candidate.startsWith('/') ||
      candidate.startsWith('//')) {
    return '/';
  }

  final parsed = Uri.tryParse(candidate);
  if (parsed == null || _isAuthRoute(parsed.path)) {
    return '/';
  }
  return candidate;
}

bool _isLoginRoute(String path) =>
    path == '/login' ||
    path == '/login/signup' ||
    path == '/login/reset-password';

bool _isAuthRoute(String path) =>
    _isLoginRoute(path) || path == '/loading' || path == '/account-error';
