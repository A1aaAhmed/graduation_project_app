import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/seats_screen/cubit/states.dart';
import 'package:graduation_project_app/shared/variables.dart';
import 'package:graduation_project_app/widgets/global.dart';
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
    emit(SeatsScreenInitialState());
  }

  void removeOddSeatFunction(int seatNumber, bool isOdd, List<bool> evenBoxes,
      List<bool> oddBoxes, int index, List<dynamic> bookedSeats) {
    oddBoxes[index] = false;
    numberOfSeats--;
    amountToBePayed -= 50;
    selectedSeats.remove(seatNumber <= 9 ? '0$seatNumber' : '$seatNumber');
    emit(RemoveSeatsState());
  }

  void removeEvenSeatFunction(int seatNumber, bool isOdd, List<bool> evenBoxes,
      List<bool> oddBoxes, int index, List<dynamic> bookedSeats) {
    evenBoxes[index] = false;
    numberOfSeats--;
    amountToBePayed -= 50;
    selectedSeats.remove(seatNumber <= 9 ? '0$seatNumber' : '$seatNumber');
    emit(RemoveSeatsState());
  }

  void changeSeatsFunction(int seatNumber, bool isOdd, List<bool> evenBoxes,
      List<bool> oddBoxes, int index, List<dynamic> bookedSeats) {
    numberOfSeats++;
    amountToBePayed += 50;
    selectedSeats.add(seatNumber <= 9 ? '0$seatNumber' : '$seatNumber');
    if (isOdd) {
      oddBoxes[index] = true;
    } else {
      evenBoxes[index] = true;
    }
    emit(ChangeSeatsState());
  }

  //2dRl1WJljsXJpNrn9KYB
  void getSeats(String trainId) {
    // print(DateFormat('EEEE').format(DateTime.parse(depart)));
    // print(trainId);
    // print(allSeats);
    FirebaseFirestore.instance
        .collection('trains')
        .doc(trainId)
        .collection('seats')
        .get()
        .then((value) {
      // print(trainId);
      // print(value.docs);
      value.docs.forEach((e) {
        allSeats = e[DateFormat('EEEE').format(DateTime.parse(depart))];
        seatsId = e.reference.id;
        // print(e.reference.id);
      });
      // print(trainId);
      // print(DateFormat('EEEE').format(DateTime.parse(depart)));
      // print(allSeats);
      // print(seatsId);
      emit(GetSeatsSuccessState());
    }).catchError((error) {
      emit(GetSeatsErrorState(error.toString()));
    });
  }

  void updateSeats(String trainId) {
    //print(DateTime.parse(depart).day);
    FirebaseFirestore.instance
        .collection('trains')
        .doc(trainId)
        .collection('seats')
        .doc(seatsId)
        .update({
      //DateFormat('EEEE').format(DateTime.parse(depart))
      DateFormat('EEEE').format(DateTime.parse(depart)): allSeats,
    }).then((value) {
      emit(UpdateSeatsSuccessState());
    }).catchError((error) {
      emit(UpdateSeatsErrorState(error));
    });
  }
}
