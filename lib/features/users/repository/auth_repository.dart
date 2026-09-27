import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
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

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    try {
      await _googleInitialization;
      await _googleSignIn.signOut();
    } catch (_) {}
  }
}
