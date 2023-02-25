import 'package:flutter/material.dart';
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
      body: Sizer(
          builder: (context, orientation, deviceType) {
            return Scaffold(
                body:ListTable(
                  db:widget.availableTickets ,
                  h:40.h,
                  w:100.w,
                ),
              );
          }),
    );
  }
}
