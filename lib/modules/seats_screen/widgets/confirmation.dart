// import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/ticket.dart';
import 'package:graduation_project_app/models/user.dart';
import 'package:graduation_project_app/modules/Ticket/ticket_screen.dart';
import 'package:graduation_project_app/modules/seats_screen/cubit/cubit.dart';
import 'package:graduation_project_app/modules/seats_screen/cubit/states.dart';
import 'package:graduation_project_app/shared/variables.dart';
import 'package:graduation_project_app/widgets/global.dart';
import 'package:graduation_project_app/shared/style/colors.dart';

Future confirmSeats(context) => showDialog(
    context: context,
    builder: (context) => BlocProvider(
      create:(BuildContext context)=>SeatsScreenCubit(),
      child: BlocConsumer<SeatsScreenCubit, SeatsScreenStates>(
            listener: (context, state) {},
            builder: (context, state) => AlertDialog(
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
                      print(selectedSeats);
                      TicketModel ticket=TicketModel(
                          date: DateTime.parse(depart),
                          from: from,
                          to: to,
                          seats: selectedSeats.join(" ,"),
                          train: gates.join(','),
                          price: amountToBePayed.toString());
                      ///need uid here
                      UserModel.addTicket(ticket: ticket, uId: "rH56bEn5CaTfTjLo3fOJ7emfyfw1");

                      for (var ele in selectedSeats) {
                        allSeats[int.parse(ele) - 1] = true;
                        if (int.parse(ele) >= 1 && int.parse(ele) <= 16) {
                          gates.add('1A');
                        } else if (int.parse(ele) >= 17 && int.parse(ele) <= 32) {
                          gates.add('2A');
                        } else {
                          gates.add('3B');
                        }
                      }
                      SeatsScreenCubit.get(context).updateSeats();
                      print(allSeats);
                      gates = gates.toSet().toList();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Ticket(ticket: ticket))
                        );

                    },
                    child: const Text(
                      'Confirm',
                      style:
                          TextStyle(color: colortheme.lightPurple, fontSize: 17),
                    )),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'Cancel',
                      style:
                          TextStyle(color: colortheme.lightPurple, fontSize: 17),
                    ))
              ],
            ),
          ),
    ));
