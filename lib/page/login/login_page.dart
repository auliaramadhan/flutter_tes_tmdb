import 'package:flutter/material.dart';
import 'package:flutter_starter_private/utils/storage_helper.dart';

import 'login_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: const LoginScreen(),
        ),
      ),
    );
  }
}
