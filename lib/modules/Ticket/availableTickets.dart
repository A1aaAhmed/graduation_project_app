import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/live_location/nothingToShow.dart';
import 'package:sizer/sizer.dart';
import 'ticketComponent/ListTable.dart';

class AvailableScreen extends StatefulWidget {
  final List availableTickets;
  const AvailableScreen({
       required this.availableTickets,
       super.key
      });
  @override
  State<AvailableScreen> createState() => _AvailableState();
}

class _AvailableState extends State<AvailableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
          body:widget.availableTickets.isNotEmpty?
          ListTable(
            db:widget.availableTickets ,
            h:40.h,
            w:100.w,
          )
        :NothingScreen(
            nothing: true,
            station:"",
            date:DateTime.now(),
            isEmpty: true,
            isFromHomeScreen: true,
          ),
        ),
    );
  }
}
