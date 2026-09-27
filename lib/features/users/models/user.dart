import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  const new({
    required this.id,
    required this.displayName,
    required this.email,
    required this.image,
    required this.role,
  });

  final String id;
  final String displayName;
  final String? email;
  final String? image;

  final Role role;

  Map<String, dynamic> toFirestore() {
    return {
      'displayName': displayName,
      'email': email,
      'image': image,
      'role': role.name,
    };
  }

  factory AppUser.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;

    return AppUser(
      id: snapshot.id,
      displayName: data['displayName'],
      email: data['email'],
      image: data['image'],
      role: Role.values.byName(data['role']),
    );
  }
}

enum Role { admin, user }
