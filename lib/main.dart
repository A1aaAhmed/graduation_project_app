import 'package:flutter/material.dart';
import 'package:graduation_project_app/layout/home_screen.dart';
import 'package:graduation_project_app/modules/livelocation_screen.dart';
import 'package:graduation_project_app/modules/profile_screen.dart';
import 'package:graduation_project_app/modules/ticket_screen.dart';
import 'package:graduation_project_app/modules/welcome_screen.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:graduation_project_app/modules/mytrips_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApisScreen(),
    );
  }
}
