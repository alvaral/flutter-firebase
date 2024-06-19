sealed class AppException implements Exception {
  AppException(this.code, this.message);
  final String code;
  final String message;

  @override
  String toString() => message;
}

// Auth exceptions
class UserNotFoundException extends AppException {
  UserNotFoundException() : super('user-not-found', 'User not found');
}

class EmailAlreadyInUseException extends AppException {
  EmailAlreadyInUseException()
      : super('email-already-in-use', 'Email already in use');
}
