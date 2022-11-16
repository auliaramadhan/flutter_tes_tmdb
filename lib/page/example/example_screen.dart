import 'package:flutter/material.dart';
import 'package:flutter_starter_private/components/form/text_form_border.dart';
import 'package:flutter_starter_private/components/spacing.dart';

import '../../components/button/button_primary.dart';
import '../../theme/appfont.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ExtraHeight(),
        Text('example', style: AppFont.body),
        TextFormBorder(label: 'label', hintText: 'hintText'),
        const ExtraHeight(),
        ButtonPrimary(
          text: 'tes',
          onPressed: () {},
        ),
        
      ],
    );
  }
}
