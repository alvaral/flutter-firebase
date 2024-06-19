import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:modernlogintute/src/features/authentication/presentation/login_screen_controller.dart';
import 'package:modernlogintute/src/routing/app_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authController = ref.watch(authenticationControllerProvider.notifier);
    final user = authController.getCurrentUser();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            onPressed: () {
              authController.signOut();
              context.goNamed(AppRoute.login.name);
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Text(
          "LOGGED IN AS: ${user?.email}",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
