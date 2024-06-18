import 'package:flutter/material.dart';
import 'package:modernlogintute/authentication_provider.dart';
import 'package:modernlogintute/screens/auth_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:modernlogintute/screens/home_screen.dart';
import 'package:modernlogintute/screens/login_screen.dart';
import 'package:modernlogintute/screens/register_screen.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthenticationProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const AuthControllerScreen(),
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const RegisterScreen(),
  '/home': (context) => const HomePage(),
};
