import 'package:flutter/material.dart';
import 'package:modernlogintute/utils/validators.dart';
import 'package:provider/provider.dart';

import 'package:modernlogintute/authentication_provider.dart';
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn(AuthenticationProvider authenticationProvider) async {
    if (_formKey.currentState!.validate()) {
      // show loading circle
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      // try sign in
      try {
        await authenticationProvider.signIn(
            emailController.text, passwordController.text);
        // pop the loading circle
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } catch (e) {
        // pop the loading circle
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        // WRONG EMAIL
        showErrorMessage(e.toString());
      }
    }
  }

  // wrong email message popup
  void showErrorMessage(String error) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              error,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authenticationProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),

                  // logo
                  const Icon(
                    Icons.lock,
                    size: 70,
                  ),

                  const SizedBox(height: 50),

                  // welcome back, you've been missed!
                  Text(
                    'Welcome back, you\'ve been missed!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // email textfield
                  CustomTextFormField(
                    controller: emailController,
                    validator: CustomValidators.emailValidator,
                    hintText: 'Email',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  // password textfield
                  CustomTextFormField(
                    controller: passwordController,
                    hintText: 'Password',
                    validator: CustomValidators.passwordValidator,
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  // forgot password?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // sign in button
                  MyButton(
                    text: 'Sign in',
                    onTap: () => signUserIn(authenticationProvider),
                  ),

                  const SizedBox(height: 50),

                  // or continue with
                  // Column(
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  //       child: Row(
                  //         children: [
                  //           Expanded(
                  //             child: Divider(
                  //               thickness: 0.5,
                  //               color: Colors.grey[400],
                  //             ),
                  //           ),
                  //           Padding(
                  //             padding:
                  //                 const EdgeInsets.symmetric(horizontal: 10.0),
                  //             child: Text(
                  //               'Or continue with',
                  //               style: TextStyle(color: Colors.grey[700]),
                  //             ),
                  //           ),
                  //           Expanded(
                  //             child: Divider(
                  //               thickness: 0.5,
                  //               color: Colors.grey[400],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),

                  //     const SizedBox(height: 50),

                  //     // google + apple sign in buttons
                  //     const Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         // google button
                  //         SquareTile(imagePath: 'lib/images/google.png'),

                  //         SizedBox(width: 25),

                  //         // apple button
                  //         SquareTile(imagePath: 'lib/images/apple.png')
                  //       ],
                  //     ),

                  //
                  //   ],
                  // ),
                  const SizedBox(height: 50),
                  // not a member? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () =>
                            Navigator.of(context).pushNamed('/register'),
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
