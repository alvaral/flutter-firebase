import 'package:modernlogintute/src/features/authentication/data/fake_authentication_repository.dart';
import 'package:modernlogintute/src/features/authentication/data/firebase_authentication_repository.dart';
import 'package:modernlogintute/src/features/authentication/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_repository.g.dart';

abstract class AuthenticationRepository {
  Stream<User?> authStateChanges();
  User? get currentUser;

  Future<void> signInWithEmailAndPassword(String email, String password);

  Future<void> createUserWithEmailAndPassword(String email, String password);

  Future<void> signOut();

  void dispose();
}

@Riverpod(keepAlive: true)
AuthenticationRepository authenticationRepository(
    AuthenticationRepositoryRef ref) {
  final auth = FirebaseAuthenticationRepository();
  ref.onDispose(() => auth.dispose());
  return auth;
}

@Riverpod(keepAlive: true)
Stream<User?> authenticationStateChanges(AuthenticationStateChangesRef ref) {
  final authenticationRepository = ref.watch(authenticationRepositoryProvider);
  return authenticationRepository.authStateChanges();
}
