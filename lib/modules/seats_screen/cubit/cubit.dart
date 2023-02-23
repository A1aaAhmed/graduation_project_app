import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/seats_screen/cubit/states.dart';
import 'package:graduation_project_app/widgets/global.dart';
import 'package:graduation_project_app/shared/style/colors.dart';

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
      List<bool> oddBoxes, int index, List<bool> bookedSeats) {
    oddBoxes[index] = false;
    numberOfSeats--;
    amountToBePayed -= 50;
    selectedSeats.remove(seatNumber <= 9 ? '0$seatNumber' : '$seatNumber');
    // boxColor=bookedSeats[index]
    //                     ? colortheme.saimon
    //                     : oddBoxes[index] && isOdd
    //                         ? colortheme.lightPurple
    //                         : evenBoxes[index] && !isOdd
    //                             ? colortheme.lightPurple
    //                             : colortheme.lightGray;
    emit(RemoveSeatsState());
    print(selectedSeats);
    print(oddBoxes);
    print(evenBoxes);
    print(isOdd);
  }

  void removeEvenSeatFunction(int seatNumber, bool isOdd, List<bool> evenBoxes,
      List<bool> oddBoxes, int index, List<bool> bookedSeats) {
    evenBoxes[index] = false;
    numberOfSeats--;
    amountToBePayed -= 50;
    selectedSeats.remove(seatNumber <= 9 ? '0$seatNumber' : '$seatNumber');
    // boxColor=bookedSeats[index]
    //                     ? colortheme.saimon
    //                     : oddBoxes[index] && isOdd
    //                         ? colortheme.lightPurple
    //                         : evenBoxes[index] && !isOdd
    //                             ? colortheme.lightPurple
    //                             : colortheme.lightGray;
    print(selectedSeats);
    print(oddBoxes);
    print(evenBoxes);
    print(isOdd);
    emit(RemoveSeatsState());
  }

  void changeSeatsFunction(int seatNumber, bool isOdd, List<bool> evenBoxes,
      List<bool> oddBoxes, int index, List<bool> bookedSeats) {
    numberOfSeats++;
    amountToBePayed += 50;
    selectedSeats.add(seatNumber <= 9 ? '0$seatNumber' : '$seatNumber');
    if (isOdd) {
      oddBoxes[index] = true;
    } else {
      evenBoxes[index] = true;
    }
    // boxColor=bookedSeats[index]
    //                     ? colortheme.saimon
    //                     : oddBoxes[index] && isOdd
    //                         ? colortheme.lightPurple
    //                         : evenBoxes[index] && !isOdd
    //                             ? colortheme.lightPurple
    //                             : colortheme.lightGray;
    print(selectedSeats);
    print(oddBoxes);
    print(evenBoxes);
    print(isOdd);

    emit(ChangeSeatsState());
  }
}
