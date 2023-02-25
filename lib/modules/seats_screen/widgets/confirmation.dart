// import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/Ticket/ticket_screen.dart';
import 'package:graduation_project_app/shared/variables.dart';
import 'package:graduation_project_app/widgets/global.dart';
import 'package:graduation_project_app/shared/style/colors.dart';

import '../../../models/ticket.dart';

   TicketModel ticket = TicketModel(
          date: DateTime.parse(depart),
          from: from,
          to: to,
          seats: '',
          train: '',
          price:'200', startTime: '', trainNUM: '',

      );

Future confirmSeats(BuildContext context,String time,String trainNUM) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
          title: const Text(
            'Confirmation',
            style: TextStyle(fontSize: 23),
          ),
          content: Text(
            'You selected ${selectedSeats.join(',')}.\n Are you sure you want to confirm these seats?',
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  
                  for (var ele in selectedSeats) {
                    if (int.parse(ele) >= 1 && int.parse(ele) <= 16) {
                      gates.add('1A');
                    } else if (int.parse(ele) >= 17 && int.parse(ele) <= 32) {
                      gates.add('2A');
                    } else {
                      gates.add('3B');
                    }
                  }
                  gates = gates.toSet().toList();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Ticket(
                          
                            date: DateTime.parse(depart!),
                            from: from!,
                            to: to!,
                            seat: selectedSeats.join(" ,"),
                            trin_number: gates.join(','),
                            trainNUM: trainNUM,
                            startTime: time,
                            price: amountToBePayed.toString(), ticket: ticket,)),
                  );
                },
                child: const Text(
                  'Confirm',
                  style: TextStyle(color: colortheme.lightPurple, fontSize: 17),
                )),
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: colortheme.lightPurple, fontSize: 17),
                ))
          ],
        ));
