// ignore_for_file: sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/seats_screen/cubit/states.dart';
import 'package:graduation_project_app/shared/components/toast.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:graduation_project_app/widgets/global.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/modules/seats_screen/cubit/cubit.dart';

class MyWidget extends StatefulWidget {
  final int start;
  const MyWidget({
    super.key,
    required this.start,
  });

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<bool> oddBoxes = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> evenBoxes = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SeatsScreenCubit, SeatsScreenStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            columnComponent(
              true,
              widget.start,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                margin: widget.start == 1
                    ? const EdgeInsets.only(top: 100)
                    : widget.start == 33
                        ? const EdgeInsets.only(bottom: 100)
                        : const EdgeInsets.all(0),
                width: 3,
                height: double.infinity,
                color: colortheme.blueGray,
              ),
            ),
            columnComponent(false, widget.start + 1),
          ],
        );
      },
    );
  }

  Widget seatComponent(int value, Color boxColor) => Container(
        margin: const EdgeInsets.all(5),
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: boxColor),
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

  Widget columnComponent(bool isOdd, int start) => Column(
        children: [
          Container(
            width: 40,
            height: 340,
            margin: start == 1 || start == 2
                ? const EdgeInsets.only(top: 100)
                : const EdgeInsets.only(top: 12),
            child: ListView.separated(
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
                        isOdd,
                        evenBoxes,
                        oddBoxes,
                        index,
                        allSeats);
                  } else if (evenBoxes[index] && !isOdd) {
                    SeatsScreenCubit.get(context).removeEvenSeatFunction(
                        seatNumber,
                        isOdd,
                        evenBoxes,
                        oddBoxes,
                        index,
                        allSeats);
                  } else {
                    if (numberOfSeats == seats) {
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
                          allSeats);
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
                                : colortheme.lightGray),
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
