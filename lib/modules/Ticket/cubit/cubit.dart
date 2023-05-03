import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/cubit/cubit.dart';
import 'package:graduation_project_app/models/ticket.dart';
import 'package:graduation_project_app/modules/Ticket/cubit/states.dart';
import 'package:graduation_project_app/modules/Ticket/timeFuns.dart';
import 'package:graduation_project_app/shared/variables.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_app/layout/transition.dart';
import 'package:intl/intl.dart';

import '../../../shared/components/components.dart';

class TicketCubit extends Cubit<TicketsStates> {
  TicketCubit() : super(TicketsInitialState());
  static TicketCubit get(context) => BlocProvider.of(context);
  List previousTickets = [];
  List availableTickets = [];
  Future<void> getAllTickets() async {
    emit(LoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId.substring(0, 3))
        .collection('numbers')
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
      if (availableTickets.isNotEmpty) {
        station = availableTickets[0].from;
        Train = availableTickets[0].train;
      }
      emit(GetAllTicketsState());
    });
  }

  Future<void> deleteAllExpired(context) async {
    if (previousTickets.isEmpty) {
      showToast(status: toastStates.ERROR, text: "Nothing to delete");
      emit(ClearExpiredTicketsState());
    } else {
      FirebaseFirestore.instance
          .collection('users')
          .doc(uId.substring(0, 3))
          .collection('numbers')
          .doc(uId)
          .collection('tickets')
          .where("date", isLessThanOrEqualTo: DateTime.now().toString())
          .get()
          .then((value) {
        value.docs.forEach((element) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(uId.substring(0, 3))
              .collection('numbers')
              .doc(uId)
              .collection('tickets')
              .doc(element.id)
              .delete()
              .then((value) {
            print("Success!");
            showToast(
                status: toastStates.SUCESS,
                text: "All expired tickets are deleted");
            previousTickets = [];
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const Trans())));
          });
        });
      });
    }
  }

  Future<void> deleteExpiredTicket(TicketModel ticket, context) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId.substring(0, 3))
        .collection('numbers')
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
            .collection('users')
            .doc(uId.substring(0, 3))
            .collection('numbers')
            .doc(uId)
            .collection('tickets')
            .doc(element.id)
            .delete()
            .then((value) {
          showToast(status: toastStates.SUCESS, text: "Your ticket is deleted");
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const Trans())));
        });
      });
    });
  }

  Future<void> deleteTicket(TicketModel ticket, context) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId.substring(0, 3))
        .collection('numbers')
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
            .collection('users')
            .doc(uId.substring(0, 3))
            .collection('numbers')
            .doc(uId)
            .collection('tickets')
            .doc(element.id)
            .delete()
            .then((value) {
          ///nadaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
          // ticket.seats.split(',').toList()
          //print(allSeats);
          //element.id
          FirebaseFirestore.instance
              .collection('trains')
              .where("trainNum", isEqualTo: ticket.train)
              .get()
              .then((value) {
            value.docs.forEach((element) {
              //print(element);
              print(element['available'][
                  '${DateFormat('EEEE').format(DateTime.parse(ticket.date.toString())).substring(0, 3)}']);
              updateData(
                  element.id,
                  element['available'][
                      '${DateFormat('EEEE').format(DateTime.parse(ticket.date.toString())).substring(0, 3)}'],
                  ticket.seats.split(',').toList(),
                  newDateTime(ticket.date.toString(), "23:59:59")
                      .toString()
                      .split(" ")
                      .first);
            });
          }).catchError((error) {
            emit(CancelTicketErrorState(error));
          });
          // updateSeats();
        });
      });
    }).then((value) {
      showToast(status: toastStates.SUCESS, text: "Your ticket is cancelled");
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => const Trans())));
    });
  }

  Future<void> updateSeats(
      String trainId, String theDayValue, List seats, String field) async {
    //print(DateTime.parse(depart).day);
    //     FirebaseFirestore.instance
    //     .collection('trains')
    //     .doc(element.id)
    //     .collection('seats')
    //     .doc(seatsId)
    //     .update({
    //   //DateFormat('EEEE').format(DateTime.parse(depart))
    //   newDateTime(ticket.date.toString(), "23:59:59").split(" ").first: allSeats,
    // }).then((value) {
    // }).catchError((error) {
    //   emit(CancelTicketErrorState(error));
    // });
    for (var ele in seats) {
      allSeats[int.parse(ele) - 1] = false;
    }
    await FirebaseFirestore.instance
        .collection('trains')
        .doc(trainId)
        .collection('seats')
        .snapshots()
        .first
        .then((value) async {
      await FirebaseFirestore.instance
          .collection('trains')
          .doc(trainId)
          .collection('seats')
          .doc(value.docs.first.id)
          .update({field: allSeats});
      // print(value.docs.first.id);
    });
  }

  Future<void> updateAvailable(
      String trainId, String theDayValue, int noOfCanceldSeats) async {
    String updatedValue =
        (int.parse(theDayValue) + noOfCanceldSeats).toString();
    print('available========= $updatedValue');
    await FirebaseFirestore.instance
        .collection('trains')
        .doc(trainId)
        .update({'available.${day}': updatedValue});
  }

  Future<void> updateBill() async {
    String? start = uId?.substring(0, 3);
    await FirebaseFirestore.instance
        .collection("users")
        .doc(start)
        .collection('numbers')
        .doc(uId)
        .update({
      'bill':
          '${double.parse(MainCubit.model!.bill.toString()) - amountToBePayed}'
    });
    print('bill======${double.parse(MainCubit.model!.bill.toString()) - amountToBePayed}');
  }

  Future<void> updateData(
      String trainId, String theDayValue, List seats, String field) async {
    updateSeats(trainId, theDayValue, seats, field).then((value) =>
        updateAvailable(trainId, theDayValue, seats.length).then(
            (value) => updateBill().then((value) {}).catchError((error) {})));
  }
}
