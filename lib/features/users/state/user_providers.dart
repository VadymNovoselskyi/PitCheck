import 'package:pit_check/features/users/models/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_providers.g.dart';

// TODO:
// When implementing auth, add an AppGate that only renders the actual app
// when the user is resolved, otherwise loader and log in screen
@Riverpod(keepAlive: true)
User currentUser(Ref ref) {
  return User(
    id: '123456789',
    firstName: 'Test',
    lastName: 'User',
    email: 'test.user@example.com',
    image: 'https://lh3.googleusercontent.com/a/ACg8ocIF_Nsx1zI0gu28OrXuVTIgVr8fBCtHZ6bjzZDbqdEB-EroWtbp=s96-c',
    role: Role.user,
  );
}
