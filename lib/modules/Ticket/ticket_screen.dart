import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/Ticket/ticketComponent/ticketComponent.dart';
import 'package:graduation_project_app/shared/components/appBar.dart';
import 'package:graduation_project_app/shared/components/button.dart';
import 'package:sizer/sizer.dart';

class Ticket extends StatefulWidget {
  final DateTime date;
  final String from;
  final String to;
  final String seat;
  final String gate;
  final String duration;


  const Ticket({
    Key? key,
    required this.date,
    required this.from,
    required this.to,
    required this.seat,
    required this.gate,
    required this.duration,
  }) : super(key: key);

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    double h= MediaQuery.of(context).size.height;
    double w= MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: bar(
        context: context,
        text: 'Current ticket',
        morelist: false,
      ),
      body: Sizer(
        builder: (context, orientation, deviceType) {
        return Container(
          width: w,
          height:h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TicketComp(
                  h:8.h,
                  w:w,
                  date: widget.date,
                  from: widget.from,
                  to: widget.to,
                  duration: widget.duration,
                  gate: widget.gate,
                  seat: widget.seat,
                  ),
              const SizedBox(height: 30),
              button(
                  text: "Navigate Route",
                  onpress: () {},
                  width: 6.w,
                  height: 20.h)
            ],
          ));}),
        );


  }
}
