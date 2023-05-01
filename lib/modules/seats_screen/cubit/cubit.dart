// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/Ticket/timeFuns.dart';
import 'package:graduation_project_app/modules/seats_screen/cubit/states.dart';
import 'package:graduation_project_app/shared/variables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class SeatsScreenCubit extends Cubit<SeatsScreenStates> {
  SeatsScreenCubit() : super(SeatsScreenInitialState());
  static SeatsScreenCubit get(context) => BlocProvider.of(context);


  void initialFunction() {
    numberOfSeats = 0;
    amountToBePayed = 0;
    selectedSeats = [];
    allSeats = [];
    fieldName = newDateTime(depart, "23:59:59").toString().split(" ").first;
    day =
    DateFormat('EEEE').format(DateTime.parse(depart)).substring(0,3);
    emit(SeatsScreenInitialState());
  }

  num amountDependingOnClass(int seatNumber) {
    if (seatNumber >= 1 && seatNumber <= 16) {
      return classType[0].price;
    } else if (seatNumber >= 17 && seatNumber <= 32) {
      return classType[1].price;
    } else {
      return classType[2].price;
    }
  }

  void removeOddSeatFunction(int seatNumber, List<bool> oddBoxes, int index) {
    oddBoxes[index] = false;
    numberOfSeats--;
    amountToBePayed -= amountDependingOnClass(seatNumber);
    selectedSeats.remove(seatNumber <= 9 ? '0$seatNumber' : '$seatNumber');
    emit(RemoveSeatsState());
  }

  void removeEvenSeatFunction(int seatNumber, List<bool> evenBoxes, int index) {
    evenBoxes[index] = false;
    numberOfSeats--;
    amountToBePayed -= amountDependingOnClass(seatNumber);
    selectedSeats.remove(seatNumber <= 9 ? '0$seatNumber' : '$seatNumber');
    emit(RemoveSeatsState());
  }

  void changeSeatsFunction(int seatNumber, bool isOdd, List<bool> evenBoxes,
      List<bool> oddBoxes, int index) {
    numberOfSeats++;
    amountToBePayed += amountDependingOnClass(seatNumber);
    selectedSeats.add(seatNumber <= 9 ? '0$seatNumber' : '$seatNumber');
    if (isOdd) {
      oddBoxes[index] = true;
    } else {
      evenBoxes[index] = true;
    }
    emit(ChangeSeatsState());
  }

  // await FirebaseFirestore.instance
  //     .collection('trains')
  //     .doc("2dRl1WJljsXJpNrn9KYB")
  //     .collection("seats")
  //     .doc('Lzmj2kh4n6gIQMQwu4sU')
  //     .update({
  //   '2023-03-06 23:59:59': FieldValue.delete(),
  // }).whenComplete(() async {
  //   print('Field deleted');
  //   emit(DeleteFieldState());
  //   await FirebaseFirestore.instance
  //       .collection('trains')
  //       .doc('2dRl1WJljsXJpNrn9KYB')
  //       .collection("seats")
  //       .doc('Lzmj2kh4n6gIQMQwu4sU')
  //       .set({'2023-03-06 23:59:59': seats}, SetOptions(merge: true)).then(
  //           (value) async {
  //     //Do your stuff.
  //     print('the field added successfully');
  //     emit(AddFieldState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(DeleteFieldErrorState(error));
  //   });
  // });
  //2dRl1WJljsXJpNrn9KYB
  List seats = List.filled(48, false);
  Future<void> getSeats(String trainId) async {
    allSeats = [];
    FirebaseFirestore.instance
        .collection('trains')
        .doc(trainId)
        .collection('seats')
        .snapshots()
        .listen((event) {
      event.docs.forEach((e) {
        //allSeats = e[DateFormat('EEEE').format(DateTime.parse(depart))];
        allSeats = e[fieldName];
        seatsId = e.reference.id;
      });
      emit(GetSeatsSuccessState());
    });
  }

  // // print(DateFormat('EEEE').format(DateTime.parse(depart)));
  // // print(trainId);
  // // print(allSeats);
  // FirebaseFirestore.instance
  //     .collection('trains')
  //     .doc(trainId)
  //     .collection('seats')
  //     .get()
  //     .then((value) {
  //   // print(trainId);
  //   // print(value.docs);
  //   value.docs.forEach((e) {
  //     allSeats = e[DateFormat('EEEE').format(DateTime.parse(depart))];
  //     seatsId = e.reference.id;
  //     // print(e.reference.id);
  //   });

  //   // print(trainId);
  //   // print(DateFormat('EEEE').format(DateTime.parse(depart)));
  //   // print(allSeats);
  //   // print(seatsId);
  //   emit(GetSeatsSuccessState());
  // }).catchError((error) {
  //   emit(GetSeatsErrorState(error.toString()));
  // });

  void updateSeats(String trainId, String theDayValue) async {
    //print(DateTime.parse(depart).day);
    await FirebaseFirestore.instance
        .collection('trains')
        .doc(trainId)
        .collection('seats')
        .doc(seatsId)
        .update({
      //DateFormat('EEEE').format(DateTime.parse(depart))
      fieldName: allSeats,
    }).then((value) async {
      String updatedValue =
          (int.parse(theDayValue) - noOfChoosenSeats).toString();
      print('the new value is $updatedValue');
      await FirebaseFirestore.instance
          .collection('trains')
          .doc(trainId)
          .update({'available.${day}': updatedValue}).then((value) {
        // print(daysOfExpiredDates);
        // print('Field added');
        // print(date);
      }).catchError((error) {
        print(error.toString());
      });

      emit(UpdateSeatsSuccessState());
    }).catchError((error) {
      emit(UpdateSeatsErrorState(error));
    });
  }
}




