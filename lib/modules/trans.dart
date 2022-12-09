import 'package:flutter/material.dart';
import 'package:graduation_project_app/layout/home_screen.dart';
import 'package:graduation_project_app/modules/livelocation_screen.dart';
import 'package:graduation_project_app/modules/profile_screen.dart';
import 'package:graduation_project_app/modules/ticket_screen.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:graduation_project_app/modules/mytrips_screen.dart';

class transition extends StatefulWidget {
  const transition({super.key});

  @override
  State<transition> createState() => _TransitionState();
}

class _TransitionState extends State<transition> {
  int currentindex = 0;
  final screens = [
    HomeScreen(),
    LiveLocationScreen(),
    Ticket(
      from: 'Alexandria',
      to: 'Aswan',
      duration: '1hr-20mins',
      seat: 'A1,A2',
      gate: 'C',
      date: DateTime.now(),
    ),
    MyTripsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        unselectedLabelStyle: TextStyle(overflow: TextOverflow.ellipsis),
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
            label: 'Current Tickets',
            icon: Icon(Icons.confirmation_num_outlined),
          ),
          BottomNavigationBarItem(
            label: 'History',
            icon: Icon(Icons.history),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
