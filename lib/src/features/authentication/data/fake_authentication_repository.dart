import 'package:modernlogintute/src/exceptions/app_exceptions.dart';
import 'package:modernlogintute/src/features/authentication/data/authentication_repository.dart';
import 'package:modernlogintute/src/features/authentication/domain/fake_user.dart';
import 'package:modernlogintute/src/features/authentication/domain/user.dart';
import 'package:modernlogintute/src/utils/in_memory_store.dart';

class FakeAuthenticationRepository implements AuthenticationRepository {
  final _authState = InMemoryStore<User?>(null);

  @override
  Stream<User?> authStateChanges() => _authState.stream;
  @override
  User? get currentUser => _authState.value;

  final List<FakeUser> _users = [];

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    for (final u in _users) {
      if (u.email == email && u.password == password) {
        _authState.value = u;
        return;
      }
      throw UserNotFoundException();
    }
  }

  @override
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    for (final u in _users) {
      if (u.email == email) throw EmailAlreadyInUseException();
    }
    _createNewUser(email, password);
  }

  void _createNewUser(String email, String password) {
    final user = FakeUser(
        id: email.split('').reversed.join(), email: email, password: password);
    _users.add(user);
    _authState.value = user;
  }

  @override
  Future<void> signOut() async {
    _authState.value = null;
  }

  @override
  void dispose() => _authState.close();
}
