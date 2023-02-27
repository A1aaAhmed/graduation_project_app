import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/Ticket/availableTickets.dart';
import 'package:graduation_project_app/modules/Ticket/cubit/cubit.dart';
import 'package:graduation_project_app/modules/Ticket/cubit/states.dart';
import 'package:graduation_project_app/modules/Ticket/expiredTickets.dart';
import 'package:graduation_project_app/shared/components/appBar.dart';
import 'package:graduation_project_app/shared/components/loading.dart';
class TicketsView extends StatelessWidget {
  const TicketsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TicketCubit()..getAllTickets(),
      child: BlocConsumer<TicketCubit,TicketsStates>(
        listener:(context, state) => {},
        builder:  (context, state) =>DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar:  bar(
            context: context,
            text: 'My Tickets',
            morelist: false,
            bottom: true
          ),
          body: TabBarView(
            children: [
              ConditionalBuilder(
                  condition:state is! LoadingState,
                  builder: (context) =>AvailableScreen(availableTickets:TicketCubit.get(context).availableTickets),
                  fallback: (context) =>const LoadingScreen(),),
              ConditionalBuilder(
                condition:state is! LoadingState,
                builder: (context) => ExpiredScreen(expiredTickets:TicketCubit.get(context).previousTickets),
                fallback: (context) =>const LoadingScreen(),),
            ],
          ),
        ),
      ),
    )
    );}
}
