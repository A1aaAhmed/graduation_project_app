import 'package:flutter/material.dart';
import 'package:graduation_project_app/models/ticket.dart';
import 'package:graduation_project_app/modules/Ticket/ticketComponent/TicketComp.dart';
import 'package:graduation_project_app/modules/Ticket/timeFuns.dart';
import 'package:graduation_project_app/modules/live_location/checkTrain.dart';
import 'package:graduation_project_app/shared/components/appBar.dart';
import 'package:graduation_project_app/shared/components/button.dart';
import 'package:sizer/sizer.dart';

class Ticket extends StatefulWidget {
  final TicketModel ticket;

  const Ticket({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  @override
  State<Ticket> createState() => _TicketState();
}
class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: Sizer(
        builder: (context, orientation, deviceType)
    {

      return Scaffold(
          appBar: bar(
            context: context,
            text: 'Current Ticket',
            morelist: false,
          ),
          body: SizedBox(
              width: 100.w,
              height: 100.h,
              child: Column(
                mainAxisAlignment: !expired(widget.ticket.date)?MainAxisAlignment.start:MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width:100.w,
                    height: 60.h,
                    child:TicketComponent(
                      view: true,
                      ticket:widget.ticket,
                  )),
                  SizedBox(height: 10.h),
                  !expired(widget.ticket.date)?button(
                      text: "Navigate Route",
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>CheckTrain(station: widget.ticket.from,date: widget.ticket.date,isFromHome: false,))));
                      },
                      width: 60.w,
                      height: 10.h,
                      context: context,

                  ):const Text(""),
                ],
              )));
    })


    );}
}
