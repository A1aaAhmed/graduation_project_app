import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/welcome_screen.dart';

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
<<<<<<< HEAD
      home: ApisScreen(),
=======
      home: Seats(),
>>>>>>> 2968b2efe822528ef823ee1314930033a1f2641e
    );
  }
}