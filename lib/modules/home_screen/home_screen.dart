import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/home_screen/firstsection/firstsection.dart';
import 'package:graduation_project_app/modules/home_screen/secondsection/secondsection.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime currentBackPressTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: const [
              FirstSection(),
              SecondSection(),
            ],
          ),
        ),
      ),
    );
  }
}
