import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'package:pit_check/features/users/models/user.dart';

class AppUserRepository {
  AppUserRepository();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<AppUser> getOrCreate(firebase_auth.User firebaseUser) async {
    final ref = _firestore.collection('users').doc(firebaseUser.uid);
    final snapshot = await ref.get();
    if (snapshot.exists) return AppUser.fromFirestore(snapshot, null);

    final name = firebaseUser.displayName?.trim();
    final created = AppUser(
      id: firebaseUser.uid,
      displayName: name == null || name.isEmpty ? 'Unknown User' : name,
      email: firebaseUser.email,
      image: firebaseUser.photoURL,
      role: Role.user,
    );

    await ref.set(created.toFirestore());
    return created;
  }
}
