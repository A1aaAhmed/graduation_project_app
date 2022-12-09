import 'package:flutter/material.dart';
import 'package:graduation_project_app/screens/home_screen.dart';
import 'package:graduation_project_app/screens/livelocation_screen.dart';
import 'package:graduation_project_app/screens/profile_screen.dart';
import 'package:graduation_project_app/style/colors.dart';
import 'package:graduation_project_app/screens/myTrips_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentindex = 0;
  final screens = [
    HomeScreen(),
    LiveLocationScreen(),
    MyTripsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(index: currentindex, children: screens),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentindex,
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: colortheme.lightPurple,
          unselectedItemColor: colortheme.lightPurple.withOpacity(0.3),
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Live Location',
              icon: Icon(Icons.gps_fixed),
            ),
            BottomNavigationBarItem(
              label: 'Tickets',
              icon: Icon(Icons.history),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
