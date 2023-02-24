import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/cubit/states.dart';

import '../../modules/History/mytrips_screen.dart';
import '../../modules/Ticket/ticket_screen.dart';
import '../../modules/live_location/livelocation_screen.dart';
import '../../modules/profile_screen.dart';
import '../../shared/variables.dart';
import '../../modules/home_screen/home_screen.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainIntialState());

  static MainCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;
  final screens = [
    const HomeScreen(),
    LiveLocationScreen(),
    Ticket(
        date: DateTime.parse(db[0]['date']),
        from: db[0]['from'],
        to: db[0]['to'],
        seat: db[0]['seat'],
        trin_number: db[0]['trin_number'],
        duration: db[0]['dur'],
        price: db[0]['price']),
    const MyTripsScreen(),
    const ProfileScreen(),
  ];

  void changeNavbarIndex(index) {
    currentindex = index;
    emit(ChangeNavBarState());
  }
}
