import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/myTrips.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTrips(),
      debugShowCheckedModeBanner: false,
    );
  }
}
