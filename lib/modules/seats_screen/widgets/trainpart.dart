// ignore_for_file: sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/seats_screen/cubit/states.dart';
import 'package:graduation_project_app/shared/components/toast.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:graduation_project_app/shared/variables.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/modules/seats_screen/cubit/cubit.dart';

class TrainPart extends StatefulWidget {
  final int start;
  const TrainPart({
    super.key,
    required this.start,
  });

  @override
  State<TrainPart> createState() => _TrainPartState();
}

class _TrainPartState extends State<TrainPart> {
  List<bool> oddBoxes = List.filled(8, false);
  List<bool> evenBoxes = List.filled(8, false);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<SeatsScreenCubit, SeatsScreenStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            columnComponent(true, widget.start, width, height),
            Padding(
              padding: EdgeInsets.all(width * 0.06),
              child: Container(
                margin: widget.start == 1
                    ? EdgeInsets.only(top: height * 0.13)
                    : widget.start == 33
                        ? EdgeInsets.only(bottom: height * 0.13)
                        : const EdgeInsets.all(0),
                width: width * 0.012,
                height: double.infinity,
                color: colortheme.blueGray,
              ),
            ),
            columnComponent(false, widget.start + 1, width, height),
          ],
        );
      },
    );
  }

  Widget seatComponent(
          int value, Color boxColor, double width, double height) =>
      Container(
        margin: EdgeInsets.all(width * 0.018),
        height: height * 0.041,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width * 0.02), color: boxColor),
        child: Center(
          child: Text(
            value <= 9 ? '0$value' : '$value',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: boxColor == colortheme.saimon ||
                        boxColor == colortheme.lightPurple
                    ? Colors.white
                    : Colors.black),
            // style: TextStyle(
            //     color: boxColor == colortheme.saimon ||
            //             boxColor == colortheme.lightPurple
            //         ? Colors.white
            //         : Colors.black),
          ),
        ),
      );

  Widget columnComponent(bool isOdd, int start, double width, double height) =>
      Column(
        children: [
          Container(
            width: width * 0.13,
            height: height * 0.5,
            margin: start == 1 || start == 2
                ? EdgeInsets.only(top: height * 0.15)
                : EdgeInsets.only(top: height * 0.0156),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () async {
                  int seatNumber = 2 * index + start;
                  if (allSeats[2 * index + start - 1]) {
                    showToast(
                      state: ToastStates.error,
                      text: 'This Seat is already booked!',
                    );
                  } else if (oddBoxes[index] && isOdd) {
                    SeatsScreenCubit.get(context).removeOddSeatFunction(
                        seatNumber,
                        oddBoxes,
                        index,
                        );
                  } else if (evenBoxes[index] && !isOdd) {
                    SeatsScreenCubit.get(context).removeEvenSeatFunction(
                        seatNumber,
                        evenBoxes,
                        index,
                        );
                  } else {
                    if (numberOfSeats == noOfChoosenSeats) {
                      showToast(
                        state: ToastStates.error,
                        text: 'You Reach The Limit!',
                      );
                    } else {
                      SeatsScreenCubit.get(context).changeSeatsFunction(
                          seatNumber,
                          isOdd,
                          evenBoxes,
                          oddBoxes,
                          index,
                          );
                    }
                  }
                },
                child: seatComponent(
                    2 * index + start,
                    allSeats[2 * index + start - 1]
                        ? colortheme.saimon
                        : oddBoxes[index] && isOdd
                            ? colortheme.lightPurple
                            : evenBoxes[index] && !isOdd
                                ? colortheme.lightPurple
                                : colortheme.lightGray,
                    width,
                    height),
              ),
              itemCount: 8,
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: index == 1 || index == 5 ? 7 : 0,
              ),
            ),
          ),
        ],
      );
}
