import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_starter_private/helper/size_config.dart';
import 'package:flutter_starter_private/page/login/login_page.dart';
import 'package:flutter_starter_private/page/main_tab/main_tab_page.dart';
import 'package:flutter_starter_private/page/register/register_page.dart';
import 'package:flutter_starter_private/theme/appfont.dart';
import 'package:flutter_starter_private/utils/storage_helper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(milliseconds: 1000),
      () {
        checkIfLogin();
      },
    );
  }

  checkIfLogin() async {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => MainTabPage()));
  //   final user = await StorageHelper.instance.readLoginData();
  //   if (user != null) {
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => NotifPage()));
  //   } else {
  //   }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Center(
      // child: Image.asset(),
      child: Text('Splash Screen', style: AppFont.title18),
    ));
  }
}
