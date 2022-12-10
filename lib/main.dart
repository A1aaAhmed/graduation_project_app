import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/Ticket/ticket_screen.dart';
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
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApisScreen(),
        //icket(date: DateTime.now(), from: 'alexandria', to: 'aswan', seat: 'ssss,ssss', gate: 'ss', duration: 'sss'),


    );
  }
}