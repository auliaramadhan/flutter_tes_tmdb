

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_private/page/example/example_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  

  Widget createWidgetUnderTest(){
    return MaterialApp(
      title: 'Example',
      home: ExamplePage(),
    );
  }
  testWidgets(
    "test check if exactly 3 example text foun",
    (WidgetTester tester) async {

      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.text('example'), findsNWidgets(3));
      
    },
  );

  testWidgets(
    "test check if many example text found",
    (WidgetTester tester) async {

      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.text('example'), findsWidgets);
      
    },
  );
}