import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/ticket.dart';
import 'package:graduation_project_app/modules/Ticket/cubit/cubit.dart';
import 'package:graduation_project_app/modules/Ticket/cubit/states.dart';
import 'package:graduation_project_app/modules/Ticket/ticketComponent/TicketComp.dart';
import 'package:graduation_project_app/modules/Ticket/timeFuns.dart';
import 'package:graduation_project_app/modules/live_location/checkTrain.dart';
import 'package:graduation_project_app/shared/components/appBar.dart';
import 'package:graduation_project_app/shared/components/button.dart';
import 'package:graduation_project_app/shared/variables.dart';
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
    return BlocProvider(
        create: (context) => TicketCubit()..getAllTickets(),
        child: BlocConsumer<TicketCubit, TicketsStates>(
            listener: (context, state) => {},
            builder: (context, state) => Scaffold(
                    body: Sizer(builder: (context, orientation, deviceType) {
                  return Scaffold(
                      appBar: bar(
                        context: context,
                        text: 'Current Ticket',
                        morelist: true,
                        ticket: widget.ticket,
                      ),
                      body: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SizedBox(
                            width: 100.w,
                            height: 100.h,
                            child: Column(
                              mainAxisAlignment: !expired(widget.ticket.date)
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width: 100.w,
                                    height: 60.h,
                                    child: TicketComponent(
                                      view: true,
                                      ticket: widget.ticket,
                                    )),
                                SizedBox(height: 10.h),
                                !expired(widget.ticket.date)
                                    ? button(
                                        text: "Navigate Route",
                                        onpress: () {
                                          Train = widget.ticket.train;
                                          print(
                                              "*****************************************************************${widget.ticket.train}");
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      CheckTrain(
                                                        trainNump:
                                                            widget.ticket.train,
                                                        station:
                                                            widget.ticket.from,
                                                        date:
                                                            widget.ticket.date,
                                                        isFromHome: false,
                                                      ))));
                                        },
                                        width: 60.w,
                                        height: 10.h,
                                        context: context,
                                      )
                                    : const Text(""),
                              ],
                            )),
                      ));
                }))));
  }
}
;