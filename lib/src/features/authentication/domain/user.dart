import 'package:firebase_auth/firebase_auth.dart' as Firebase;

class User {
  User({
    required this.id,
    required this.email,
  });

  factory User.fromFirebase(Firebase.User user) {
    return User(email: user.email!, id: user.uid);
  }

  final String email;
  final String id;

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id && other.email == email;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode;

  @override
  String toString() => 'User(id: $id, email: $email)';
}
