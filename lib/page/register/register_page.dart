import 'package:flutter/material.dart';
import 'register_screen.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: const RegisterScreen(),
      ),
    );
  }
}
