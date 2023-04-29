import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/cubit/cubit.dart';
import 'package:graduation_project_app/layout/cubit/states.dart';
import 'package:graduation_project_app/shared/style/colors.dart';

class Trans extends StatelessWidget {
  const Trans({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (BuildContext context, MainStates MainStates) {},
      builder: (BuildContext context, MainStates MainStates) {
        MainCubit cubit = MainCubit.get(context);
        // cubit.initPlatformState();
        // cubit.checkExpiredDate();
        // cubit.update();
        // cubit.previousDates();
        // cubit.addFutureFields();
        // cubit.addOnePreviousField();
        // cubit.deleteAllFields();
        // cubit.test();
        // cubit.getFields();
        // cubit.resetSeats();
        // print(cubit.currentindex);
        // print("///////////////////");
        return Scaffold(
          body: cubit.screens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentindex,
            onTap: (index) {
              cubit.changeNavbarIndex(index);
            },
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
                label: 'My Tickets',
                icon: Icon(Icons.history),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(Icons.person),
              ),
            ],
          ),
        );
      },
    );
  }
}
