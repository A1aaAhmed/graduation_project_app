import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project_app/modules/profile_screen.dart';
import 'package:graduation_project_app/modules/social/welcome_screen.dart';
import 'package:graduation_project_app/network/local/shared_pref.dart';
import 'package:graduation_project_app/shared/bloc_observer.dart';

import 'firebase_options.dart';


void main()async
{
  //Locking Device Orientation to Portrait
  WidgetsFlutterBinding.ensureInitialized(); //to make sure that all this fun ocured first before runApp
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await casheHelper.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}
