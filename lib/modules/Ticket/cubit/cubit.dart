import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/ticket.dart';
import 'package:graduation_project_app/modules/Ticket/cubit/states.dart';
import 'package:graduation_project_app/modules/Ticket/timeFuns.dart';
import 'package:graduation_project_app/shared/variables.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_app/layout/transition.dart';

import '../../../shared/components/components.dart';

class TicketCubit extends Cubit<TicketsStates> {
  TicketCubit() : super(TicketsInitialState());
  static TicketCubit get(context) => BlocProvider.of(context);
  List previousTickets = [];
  List availableTickets = [];
  Future<void> getAllTickets() async {
    emit(LoadingState());
    // print("innnnnnnnnnnnnnnnnnnnn");
    ///need uid here
    FirebaseFirestore.instance
        .collection("users")
        .doc(uId)
        .collection('tickets')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        if (expired(TicketModel.fromJason(element.data()).date)) {
          previousTickets.add(TicketModel.fromJason(element.data()));
        } else {
          availableTickets.add(TicketModel.fromJason(element.data()));
        }
      });
      previousTickets.sort((a, b) => b.date.compareTo(a.date));
      availableTickets.sort((a, b) => a.date.compareTo(b.date));
      availableTicket = availableTickets;
      if (availableTickets.isNotEmpty) station = availableTickets[0].from;
      // print(previousTickets);
      // print(availableTickets);
      // print(availableTickets[0].date);
      emit(GetAllTicketsState());
    });
  }

  Future<void> deleteAllExpired(context) async {
    if (previousTickets.isEmpty) {
      showToast(status: toastStates.ERROR, text: "Nothing to delete");
      emit(ClearExpiredTicketsState());
    } else {
      FirebaseFirestore.instance
          .collection("users")
          .doc(uId)
          .collection('tickets')
          .where("date", isLessThanOrEqualTo: DateTime.now().toString())
          .get()
          .then((value) {
        value.docs.forEach((element) {
          FirebaseFirestore.instance
              .collection("users")
              .doc(uId)
              .collection('tickets')
              .doc(element.id)
              .delete()
              .then((value) {
            print("Success!");
            showToast(
                status: toastStates.SUCESS, text: "All expired tickets are deleted");
            previousTickets = [];
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const Trans())));

          });
        });
      });

    }
  }

  Future<void> deleteExpiredTicket(TicketModel ticket,context) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(uId)
        .collection('tickets')
        .where("date", isEqualTo: ticket.date.toString())
        .where("from", isEqualTo: ticket.from)
        .where("to", isEqualTo: ticket.to)
        .where("train", isEqualTo: ticket.train)
        .where("seats", isEqualTo: ticket.seats)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        FirebaseFirestore.instance
            .collection("users")
            .doc(uId)
            .collection('tickets')
            .doc(element.id)
            .delete().then((value) {
          showToast(status: toastStates.SUCESS, text: "Your ticket is deleted");
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => const Trans())));

        });
      });
    });


  }

  Future<void> deleteTicket(TicketModel ticket,context) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(uId)
        .collection('tickets')
        .where("date", isEqualTo: ticket.date.toString())
        .where("from", isEqualTo: ticket.from)
        .where("to", isEqualTo: ticket.to)
        .where("train", isEqualTo: ticket.train)
        .where("seats", isEqualTo: ticket.seats)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        FirebaseFirestore.instance
            .collection("users")
            .doc(uId)
            .collection('tickets')
            .doc(element.id)
            .delete()
            .then((value) {
          ///nadaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          for (var ele in ticket.seats.split(',').toList()) {
            allSeats[int.parse(ele) - 1] = false;
          }
          //print(allSeats);
          FirebaseFirestore.instance
              .collection('trains')
              .where("trainNum", isEqualTo: ticket.train)
              .get()
              .then((value) {
            value.docs.forEach((element) {
              
              FirebaseFirestore.instance
                  .collection('trains')
                  .doc(element.id)
                  .collection('seats')
                  .doc(seatsId)
                  .update({
                //DateFormat('EEEE').format(DateTime.parse(depart))
                newDateTime(ticket.date.toString(), "23:59:59"): allSeats,
              }).then((value) {


              }).catchError((error) {
                emit(CancelTicketErrorState(error));
              });
              //print(element);
            });
          }).catchError((error) {
            emit(CancelTicketErrorState(error));
          });
          // updateSeats();
        });
      });
    }).then((value) {
      showToast(
          status: toastStates.SUCESS,
          text: "Your ticket is cancelled");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: ((context) => const Trans())));
    });
  }
}
