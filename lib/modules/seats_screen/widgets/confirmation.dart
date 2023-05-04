// import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/user.dart';
import 'package:graduation_project_app/modules/Ticket/ticket_screen.dart';
import 'package:graduation_project_app/modules/Ticket/timeFuns.dart';
import 'package:graduation_project_app/modules/seats_screen/cubit/cubit.dart';
import 'package:graduation_project_app/modules/seats_screen/cubit/states.dart';
import 'package:graduation_project_app/shared/components/toast.dart';
import 'package:graduation_project_app/shared/variables.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import '../../../models/ticket.dart';

Future confirmSeats(BuildContext context, String time, String trainNUM,
        Map<String, dynamic> train) =>
    showDialog(
        context: context,
        builder: (context) => BlocProvider(
              create: (context) => SeatsScreenCubit(),
              child: BlocConsumer<SeatsScreenCubit, SeatsScreenStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  return AlertDialog(
                    title: Text('Confirmation',
                        style: Theme.of(context).textTheme.bodyMedium),
                    content: Text(
                      'You selected ${selectedSeats.join(',')} and the amount is ${amountToBePayed}.\n Are you sure you want to confirm these seats?',
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () async {
                            for (var ele in selectedSeats) {
                              // print(!allSeats[int.parse(ele) - 1]);
                              allSeats[int.parse(ele) - 1] = true;
                            }
                            TicketModel ticket = TicketModel(
                                date: toDateTime(depart, time),
                                from: from,
                                to: to,
                                seats: selectedSeats.join(" ,"),
                                train: trainNUM,
                                price: amountToBePayed.toString());
                            await SeatsScreenCubit.get(context)
                                .updateData(train['trainID'],
                                    train['available']['${day}'])
                                .then((value) {
                              UserModel.addTicket(ticket: ticket, uId: uId);
                              gates = gates.toSet().toList();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Ticket(
                                          ticket: ticket,
                                        )),
                              );
                            });

                            // print(allSeats);
                            ///need uid here yaaaa mahaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                          },
                          child: const Text(
                            'Confirm',
                            style: TextStyle(
                                color: colortheme.lightPurple, fontSize: 17),
                          )),
                      TextButton(
                          onPressed: () async {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                                color: colortheme.lightPurple, fontSize: 17),
                          ))
                    ],
                  );
                },
              ),
            ));
