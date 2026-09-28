import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final _firebaseAuth = firebase_auth.FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn.instance;
  late final Future<void> _googleInitialization = _googleSignIn.initialize();

  Stream<firebase_auth.User?> authStateChanges() =>
      _firebaseAuth.authStateChanges();

  Future<void> signInWithEmail(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUpWithEmail({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user!;
      await user.updateDisplayName(fullName.trim());
    } catch (_) {}
  }

  Future<void> sendPasswordResetEmail(String email) =>
      _firebaseAuth.sendPasswordResetEmail(email: email);

  Future<void> signInWithGoogle() async {
    await _googleInitialization;

    GoogleSignInAccount googleUser;
    try {
      googleUser = await _googleSignIn.authenticate();
    } on GoogleSignInException catch (error) {
      if (error.code == GoogleSignInExceptionCode.canceled) return;
      rethrow;
    }

    final idToken = googleUser.authentication.idToken;
    if (idToken == null) {
      throw StateError('Google did not return an ID token');
    }

    await _firebaseAuth.signInWithCredential(
      firebase_auth.GoogleAuthProvider.credential(idToken: idToken),
    );
  }

  // Facebook credential flow: https://firebase.google.com/docs/auth/flutter/federated-auth#facebook
  // Limited login nonce flow: https://firebase.google.com/docs/auth/ios/facebook-login#implement_facebook_limited_login
  Future<void> signInWithFacebook() async {
    final random = Random.secure();
    final rawNonce = base64UrlEncode(
      List<int>.generate(32, (_) => random.nextInt(256)),
    );

    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

    final result = await FacebookAuth.instance.login(nonce: hashedNonce);
    if (result.status == LoginStatus.cancelled) return;
    if (result.status != LoginStatus.success || result.accessToken == null) {
      throw StateError(result.message ?? 'Facebook sign-in failed');
    }

    final token = result.accessToken!;
    final credential = token.type == AccessTokenType.limited
        ? firebase_auth.OAuthProvider('facebook.com')
              .credential(idToken: token.tokenString, rawNonce: rawNonce)
        : firebase_auth.FacebookAuthProvider.credential(token.tokenString);

    await _firebaseAuth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    // Clear each provider separately so one SDK failing does not skip the other.
    try {
      await _googleInitialization;
      await _googleSignIn.signOut();
    } catch (_) {}
    try {
      await FacebookAuth.instance.logOut();
    } catch (_) {}
  }
}
