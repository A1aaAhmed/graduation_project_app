//import 'package:background_fetch/background_fetch.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/cubit/cubit.dart';
import 'package:graduation_project_app/layout/transition.dart';
import 'package:graduation_project_app/modules/home_screen/cubit/cubit.dart';
import 'package:graduation_project_app/modules/social/cubit/cubit.dart';

import 'package:graduation_project_app/modules/social/phoneGoggle_screen.dart';

import 'package:graduation_project_app/modules/social/welcome_screen.dart';
import 'package:graduation_project_app/network/local/shared_pref.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:sizer/sizer.dart';
import 'package:graduation_project_app/shared/bloc_observer.dart';
import 'firebase_options.dart';
import 'package:background_fetch/background_fetch.dart';


  
void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //to make sure that all this fun ocured first before runApp
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await casheHelper.init();
  Widget? widget;
  var uId = casheHelper.getData(key: 'uId');
  if (uId == null) {
    widget = const welcomeScreen();
  } else {
    widget = const Trans();
  }


  //Locking Device Orientation to Portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp(
        startScreen: widget,
      )));

  runApp(MyApp(
    startScreen: widget,
  ));
  
}

class MyApp extends StatelessWidget {
  final Widget? startScreen;
  MyApp({this.startScreen});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {

      return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) {
              // if (expired(DateTime.parse(
              //     newDateTime(DateTime.now().toString(), "23:59:00")))) {
              //   return MainCubit()
              //     ..userGetData()
              //     ..resetSeats();
              // } else {
              return MainCubit()
                ..userGetData()
                ..resetSeats()
                // ..deleteAllFields()
                // ..addOnePreviousField()
                
                
                ;
              // }
            }),
            BlocProvider(
              create: (context) => HomeScreenCubit(),
            ),
                        BlocProvider(
              create: (context) => AuthCubit(),
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              iconTheme:
                  const IconThemeData(color: colortheme.lightPurple, size: 30),
              appBarTheme: const AppBarTheme(
                color: colortheme.lightPurple,
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: colortheme.lightPurple,
                  statusBarIconBrightness: Brightness.light,
                ),
                iconTheme: IconThemeData(
                  color: colortheme.white,
                  size: 22,
                ),
                titleTextStyle: TextStyle(
                  color: colortheme.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kalam',
                  fontSize: 25,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: colortheme.lightGray,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: colortheme.lightPurple,
                unselectedItemColor: colortheme.lightPurple.withOpacity(0.35),
                unselectedLabelStyle:
                    const TextStyle(overflow: TextOverflow.ellipsis),
              ),
              scaffoldBackgroundColor: colortheme.lightGray,
              fontFamily: 'kalam',
              textTheme: const TextTheme(
                bodyLarge: TextStyle(fontSize: 30),
                bodyMedium: TextStyle(fontSize: 20),
                bodySmall: TextStyle(fontSize: 15),
              ),
            ),
            home: phoneScreen(),
          ));
    });
  }
}
