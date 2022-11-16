import 'package:flutter/material.dart';
import 'package:flutter_starter_private/theme/apptheme.dart';
import 'package:flutter_starter_private/utils/storage_helper.dart';

import 'example_screen.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('example'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("example"),
            style: AppTheme.buttonTextPrimary,
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: const ExampleScreen(),
        ),
      ),
    );
  }
}
