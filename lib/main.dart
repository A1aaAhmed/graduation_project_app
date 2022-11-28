import 'package:flutter/material.dart';
import 'package:graduation_project_app/widgets/button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child:
                button(text: "hello", onpress: () {}, width: 200, height: 50)),
      ),
    );
  }
}
