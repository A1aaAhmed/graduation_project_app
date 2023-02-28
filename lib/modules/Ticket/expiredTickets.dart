import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/live_location/nothingToShow.dart';
import 'package:sizer/sizer.dart';
import 'ticketComponent/ListTable.dart';

class ExpiredScreen extends StatefulWidget {
  final  expiredTickets;
  const ExpiredScreen({
    required this.expiredTickets,
    super.key
  });
  @override
  State<ExpiredScreen> createState() => _ExpiredState();
}
class _ExpiredState extends State<ExpiredScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:widget.expiredTickets.isNotEmpty?
      ListTable(
            db:widget.expiredTickets ,
            h:40.h,
            w:100.w,
          )
        :NothingScreen(
        nothing: true,
         station: "",
        date:DateTime.now(),
        isEmpty: true,
        isFromHomeScreen: true,
      ),
    );
  }
}
