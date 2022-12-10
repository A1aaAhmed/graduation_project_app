import 'package:flutter/material.dart';
import 'package:graduation_project_app/layout/transition.dart';
import 'package:graduation_project_app/shared/components/appBar.dart';
import 'package:graduation_project_app/shared/components/button.dart';
import 'package:graduation_project_app/shared/components/ticketComponent.dart';

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
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: bar(
        context: context,
        text: 'Current ticket',
        morelist: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: TicketComp(
                date: widget.date,
                from: widget.from,
                to: widget.to,
                duration: widget.duration,
                gate: widget.gate,
                seat: widget.seat,
                size: size),
          ),
          const SizedBox(height: 30),
          button(
              text: "Navigate Route",
              onpress: () {},
              width: size.width * 0.7,
              height: 60)
        ],
      ),
    );
  }
}
