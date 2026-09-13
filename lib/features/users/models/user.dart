import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  const new({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
    required this.role,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String image;

  final Role role;

  String get fullName => '$firstName $lastName'.trim();

  Map<String, dynamic> toFirestore() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'image': image,
      'role': role.name,
    };
  }

  factory User.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    if (data == null) {
      throw StateError('User document does not exist');
    }

    return User(
      id: snapshot.id,
      firstName: data['firstName'],
      lastName: data['lastName'],
      email: data['email'],
      image: data['image'],
      role: Role.values.byName(data['role']),
    );
  }
}

enum Role { admin, user }
