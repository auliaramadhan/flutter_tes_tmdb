import 'package:flutter/material.dart';
import 'package:flutter_starter_private/components/form/text_form_border.dart';
import 'package:flutter_starter_private/components/spacing.dart';
import 'package:flutter_starter_private/helper/utils.dart';
import 'package:flutter_starter_private/page/register/register_page.dart';
import 'package:flutter_starter_private/utils/storage_helper.dart';

import '../../components/button/button_primary.dart';
import '../../theme/appfont.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool remember = false;
  final TextEditingController usernameField = TextEditingController();
  final TextEditingController passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExtraHeight(30),
        Text("Masuk", style: AppFont.title22),
        ExtraHeight(),
        const Text(
          "Silakan masuk dengan email",
          textAlign: TextAlign.left,
        ),
        ExtraHeight(),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormBorder(
                prefixIcon: Icon(Icons.person),
                controller: usernameField,
                label: 'email',
                hintText: 'Masukkan email',
                validator: Utils.formValidator('Email harus diisi'),
              ),
              ExtraHeight(),
              TextFormBorder(
                  prefixIcon: Icon(Icons.lock),
                  controller: passwordField,
                  obscureText: true,
                  label: 'Password',
                  hintText: 'Masukkan Password',
                  validator: Utils.formValidator(
                    'Password harus diisi',
                    (value) {
                      if ((value?.length ?? 0) < 5) {
                        return 'minimal 5';
                        // return null;
                      }
                    },
                  )),
              ExtraHeight(16),
              // Row(
              //   children: [
              //     Checkbox(
              //       value: remember,
              //       activeColor: AppTheme.primary,
              //       onChanged: (value) {
              //         setState(() {
              //           remember = value!;
              //         });
              //       },
              //     ),
              //     const Text("Ingat Saya", style: AppFont.body),
              //     const Spacer(),
              //   ],
              // ),
              ExtraHeight(20),
              ButtonPrimary(
                text: "Masuk",
                onPressed: () async {
                },
              ),
              ExtraHeight(40),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const RegisterPage()));
                  },
                  child: const Text(
                    "Belum Punya akun? Register",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
