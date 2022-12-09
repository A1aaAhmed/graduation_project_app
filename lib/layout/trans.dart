import 'package:flutter/material.dart';
import 'package:graduation_project_app/layout/home_screen/home_screen.dart';
import 'package:graduation_project_app/modules/livelocation_screen.dart';
import 'package:graduation_project_app/modules/profile_screen.dart';
import 'package:graduation_project_app/modules/ticket_screen.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:graduation_project_app/modules/mytrips_screen.dart';

class Transition extends StatefulWidget {
  const Transition({super.key});

  @override
  State<Transition> createState() => _TransitionState();
}

class _TransitionState extends State<Transition> {
  int currentindex = 0;
  final screens = [
    const HomeScreen(),
    const LiveLocationScreen(),
    Ticket(
      from: 'Alexandria',
      to: 'Aswan',
      duration: '1hr-20mins',
      seat: 'A1,A2',
      gate: 'C',
      date: DateTime.now(),
    ),
    MyTripsScreen(),
   const ProfileScreen(),
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
        unselectedLabelStyle: const TextStyle(overflow: TextOverflow.ellipsis),
        items: const [
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
