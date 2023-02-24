import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/cubit/states.dart';
import 'package:graduation_project_app/models/ticket.dart';

import '../../modules/History/mytrips_screen.dart';
import '../../modules/Ticket/ticket_screen.dart';
import '../../modules/live_location/livelocation_screen.dart';
import '../../modules/profile_screen.dart';
import '../../shared/variables.dart';
import '../../modules/home_screen/home_screen.dart';
TicketModel ticket= TicketModel(
    date: DateTime.parse(db[0]['date']),
    from: db[0]['from'],
    to: db[0]['to'],
    seats: db[0]['seat'],
    train: db[0]['trin_number'],
    duration: db[0]['dur'],
    price: db[0]['price']
);
class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainIntialState());
  static MainCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  final screens = [
    const HomeScreen(),
    LiveLocationScreen(),
    Ticket(ticket: ticket),
    const MyTripsScreen(),
    const ProfileScreen(),
  ];

  void changeNavbarIndex(index) {
    currentindex = index;
    emit(ChangeNavBarState());
  }
}
