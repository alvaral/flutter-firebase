import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modernlogintute/src/features/authentication/data/authentication_repository.dart';
import 'package:modernlogintute/src/routing/not_found_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:modernlogintute/src/features/feature2/home_screen.dart';
import 'package:modernlogintute/src/features/authentication/presentation/login/login_screen.dart';
import 'package:modernlogintute/src/features/authentication/presentation/register/register_screen.dart';

part 'app_router.g.dart';

enum AppRoute {
  login,
  register,
  home,
}

// routes
final routes = [
  GoRoute(
    path: '/login',
    name: AppRoute.login.name,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/register',
    name: AppRoute.register.name,
    pageBuilder: (context, state) => const MaterialPage(
      fullscreenDialog: true,
      child: RegisterScreen(),
    ),
  ),
  GoRoute(
    path: '/home',
    name: AppRoute.home.name,
    pageBuilder: (context, state) => const MaterialPage(
      fullscreenDialog: true,
      child: HomeScreen(),
    ),
  ),
];

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final authenticationRepository = ref.watch(authenticationRepositoryProvider);
  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final bool isLoggedIn = (authenticationRepository.currentUser != null);
      final String path = state.uri.path;

      if (isLoggedIn) {
        if (path == '/login') {
          return '/home';
        }
      } else {
        if (path != '/login') {
          return '/login';
        }
      }
    },
    routes: routes,
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
