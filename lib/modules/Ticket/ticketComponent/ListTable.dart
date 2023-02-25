// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:graduation_project_app/models/ticket.dart';
import 'package:graduation_project_app/modules/Ticket/ticketComponent/TicketComp.dart';
import 'package:graduation_project_app/modules/Ticket/ticket_screen.dart';

Widget ListTable({
  required double h,
  required double w,
  required List db,
}) {

  return ListView.builder(
    padding: EdgeInsets.zero,
    scrollDirection: Axis.vertical,
    itemBuilder: (context, index) {
      TicketModel ticket = TicketModel(
          date: db[index].date,
          from: db[index].from,
          to: db[index].to,
          seats: db[index].seats,
          train: db[index].train,
          price: db[index].price,
      );
      return SizedBox(
        height: h,
        width: w,
        child: MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) =>
                        Ticket(
                         ticket :ticket,))));
          },
          child: TicketComponent(
              view: false,
              ticket: ticket
          ),
        ),
      );
    },
    itemCount: db.length,
  );
}