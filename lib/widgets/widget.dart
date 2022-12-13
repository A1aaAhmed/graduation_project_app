// ignore_for_file: sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:graduation_project_app/widgets/global.dart' as globals;
import 'package:fluttertoast/fluttertoast.dart';

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
  List<bool> bookedSeats = [
    true,
    false,
    false,
    true,
    false,
    false,
    true,
    false,
  ];
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
  void initState() {
    globals.selectedSeats = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
  }

  Widget seatComponent(int value, Color boxColor) => Container(
        margin: const EdgeInsets.all(5),
        height: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: boxColor),
        child: Center(
          child: Text(
            value <= 9 ? '0$value' : '$value',
            style: TextStyle(
                color: boxColor == colortheme.saimon ||
                        boxColor == colortheme.lightPurple
                    ? Colors.white
                    : Colors.black),
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
                  if (bookedSeats[index]) {
                    await Fluttertoast.showToast(
                        msg: "This Seat is already booked!",
                        toastLength: Toast.LENGTH_LONG,
                        backgroundColor: Colors.red[900],
                        textColor: Colors.white,
                        fontSize: 20,
                        gravity: ToastGravity.BOTTOM);
                  } else if (oddBoxes[index] && isOdd) {
                    setState(() {
                      oddBoxes[index] = false;
                      globals.numberOfSeats.value--;
                      globals.amountToBePayed.value -= 50;
                      globals.selectedSeats.remove(
                          seatNumber <= 9 ? '0$seatNumber' : '$seatNumber');
                      //print(globals.selectedSeats);
                    });
                  } else if (evenBoxes[index] && !isOdd) {
                    setState(() {
                      evenBoxes[index] = false;
                      globals.numberOfSeats.value--;
                      globals.amountToBePayed.value -= 50;
                      globals.selectedSeats.remove(
                          seatNumber <= 9 ? '0$seatNumber' : '$seatNumber');
                      //print(globals.selectedSeats);
                    });
                  } else {
                    if (globals.numberOfSeats.value == globals.seats) {
                      await Fluttertoast.showToast(
                          msg: "You Reach The Limit!",
                          toastLength: Toast.LENGTH_LONG,
                          backgroundColor: Colors.red[900],
                          textColor: Colors.white,
                          fontSize: 20,
                          gravity: ToastGravity.BOTTOM);
                    } else {
                      setState(() {
                        globals.numberOfSeats.value++;
                        globals.amountToBePayed.value += 50;
                        globals.selectedSeats.add(
                            seatNumber <= 9 ? '0$seatNumber' : '$seatNumber');
                        //print(globals.selectedSeats);
                        if (isOdd) {
                          oddBoxes[index] = true;
                        } else {
                          evenBoxes[index] = true;
                        }
                      });
                    }
                  }
                },
                child: seatComponent(
                    2 * index + start,
                    bookedSeats[index]
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
