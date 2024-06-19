import 'package:modernlogintute/src/features/authentication/domain/user.dart';

class FakeUser extends User {
  final String password;

  FakeUser({
    required super.id,
    required super.email,
    required this.password,
  });
}
