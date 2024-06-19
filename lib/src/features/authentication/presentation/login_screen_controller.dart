import 'package:modernlogintute/src/features/authentication/data/authentication_repository.dart';
import 'package:modernlogintute/src/features/authentication/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_screen_controller.g.dart';

@riverpod
class AuthenticationController extends _$AuthenticationController {
  @override
  FutureOr<void> build() {
    //nothing to do
  }

  Future<void> login({required String email, required String password}) async {
    final authenticationRepository = ref.read(authenticationRepositoryProvider);
    return await authenticationRepository.signInWithEmailAndPassword(
        email, password);
  }

  Future<void> register(
      {required String email, required String password}) async {
    final authenticationRepository = ref.read(authenticationRepositoryProvider);
    return await authenticationRepository.createUserWithEmailAndPassword(
        email, password);
  }

  Future<void> signOut() async {
    final authenticationRepository = ref.read(authenticationRepositoryProvider);
    return await authenticationRepository.signOut();
  }

  User? getCurrentUser() {
    final authenticationRepository = ref.read(authenticationRepositoryProvider);
    return authenticationRepository.currentUser;
  }
}
