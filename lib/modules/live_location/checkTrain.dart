import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/Ticket/cubit/cubit.dart';
import 'package:graduation_project_app/modules/Ticket/cubit/states.dart';
import 'package:graduation_project_app/modules/Ticket/timeFuns.dart';
import 'package:graduation_project_app/modules/live_location/livelocation_screen.dart';
import 'package:graduation_project_app/shared/components/appBar.dart';
import 'package:graduation_project_app/modules/live_location/nothingToShow.dart';
import 'package:graduation_project_app/shared/components/loading.dart';
import 'package:graduation_project_app/shared/variables.dart';
class CheckTrain extends StatelessWidget {
  final DateTime date;
  final bool isFromHome;
  final String station;
  final String trainNump;
  const CheckTrain({required this.date,required this.isFromHome ,required this.station, required this.trainNump ,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TicketCubit()..getAllTickets(),
        child: BlocConsumer<TicketCubit,TicketsStates>(
        listener:(context, state) => {},
        builder:  (context, state) =>
        Scaffold(
           appBar: bar(context: context, text: 'Live location', morelist: false),
           body:
           ConditionalBuilder(
             condition:state is! LoadingState,
             builder: (context) =>ConditionalBuilder(
               condition:!isFromHome&&isToday(date)&&started(date)||
                   isFromHome&&availableTicket.isNotEmpty&&isToday(availableTicket[0].date)&&started(availableTicket[0].date),
               builder: (context) =>  LiveLocationScreen(trainNump:trainNump),
               fallback: (context) => NothingScreen(trainNump: trainNump,nothing: false,station: station,isFromHomeScreen: isFromHome,date:isFromHome?availableTicket.isEmpty?DateTime.now():availableTicket[0].date:date,isEmpty:availableTicket.isEmpty),),
             fallback: (context) =>const LoadingScreen(),),

      )));}
}
