import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/seats_screen/cubit/states.dart';
import 'package:graduation_project_app/widgets/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SeatsScreenCubit extends Cubit<SeatsScreenStates> {
  SeatsScreenCubit() : super(SeatsScreenInitialState());
  static SeatsScreenCubit get(context) => BlocProvider.of(context);

  void initialFunction() {
    numberOfSeats = 0;
    amountToBePayed = 0;
    seats;
    selectedSeats = [];

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
  void getSeats() {
    print(allSeats);
    FirebaseFirestore.instance
        .collection('trains')
        .doc(trainId)
        .collection('seats')
        .doc(seatsId)
        .get()
        .then((value) {
      print(value['Friday']);
      print(value['Friday'].runtimeType);
      allSeats = value['Friday'];
      print(allSeats);
      emit(GetSeatsSuccessState());
    }).catchError((error) {
      emit(GetSeatsErrorState(error.toString()));
    });
  }

  void updateSeats() {
    FirebaseFirestore.instance
        .collection('trains')
        .doc(trainId)
        .collection('seats')
        .doc(seatsId)
        .update({
      'Friday': allSeats,
    }).then((value) {
      emit(UpdateSeatsSuccessState());
    }).catchError((error) {
      emit(UpdateSeatsErrorState(error));
    });
  }
}
