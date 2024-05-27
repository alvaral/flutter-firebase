import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  AuthenticationProvider() {
    _auth.authStateChanges().listen((User? user) {
      log('authentication provider change: last user ${_user.toString()} new user ${user.toString()} ');
      _user = user;

      notifyListeners();
    });
  }

  User? get currentUser => _user;

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
