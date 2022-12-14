// import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/Ticket/ticket_screen.dart';
import 'package:graduation_project_app/shared/variables.dart';
import 'package:graduation_project_app/widgets/global.dart' as globals;
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:graduation_project_app/widgets/global.dart';

Future confirmSeats(BuildContext context) => showDialog(
    context: context,
    builder: (context) => AlertDialog(
          title: const Text(
            'Confirmation',
            style: TextStyle(fontSize: 23),
          ),
          content: Text(
            'You selected ${globals.selectedSeats.join(',')}.\n Are you sure you want to confirm these seats?',
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Ticket(
                            date:DateTime.parse(depart.text),
                            from: from.text,
                            to: to.text,
                            seat: selectedSeats.join(" ,"),
                            gate: "",
                            duration: "dur",
                            price: "price"
                        )),
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
