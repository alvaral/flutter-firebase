import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:modernlogintute/src/features/authentication/data/authentication_repository.dart';
import 'package:modernlogintute/src/features/authentication/domain/user.dart'
    as app_user;

class FirebaseAuthenticationRepository implements AuthenticationRepository {
  User? _user;
  final FirebaseAuth _authState = FirebaseAuth.instance;

  FirebaseAuthenticationRepository() {
    _authState.authStateChanges().listen((User? user) {
      log('authentication provider change: last user ${_user.toString()} new user ${user.toString()} ');
      _user = user;
    });
  }

  @override
  app_user.User? get currentUser {
    if (_user != null) {
      return app_user.User.fromFirebase(_user!);
    }
    return null;
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _authState.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = await _authState.authStateChanges().last;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _authState.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = await _authState.authStateChanges().last;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> signOut() async {
    await _authState.signOut();
  }

  @override
  void dispose() {
    // nothing to do
  }

  @override
  Stream<app_user.User?> authStateChanges() {
    _authState.authStateChanges().listen((User? user) {
      log('authentication provider change: last user ${_user.toString()} new user ${user.toString()} ');
      _user = user;
    });
    return _authState.authStateChanges().asyncMap((u) {
      if (u != null) {
        return app_user.User.fromFirebase(u);
      } else {
        return null;
      }
    });
  }
}
