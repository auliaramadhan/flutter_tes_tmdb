import 'package:flutter/material.dart';
import 'package:flutter_starter_private/helper/global.dart';
import 'package:flutter_starter_private/helper/size_config.dart';
import 'package:flutter_starter_private/page/splash.dart';
import 'package:flutter_starter_private/theme/app_color.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starter',
      scaffoldMessengerKey: scaffoldMessengerKey,
      // navigatorObservers: [AppNavigatorObserver()],
      theme: ThemeData(
        fontFamily: 'Nunito',
        primarySwatch: AppColor.primary,
        // textSelectionTheme: const TextSelectionThemeData(cursorColor: AppColor.primary),
      ),
      home: SplashPage(),
    );
  }
}
