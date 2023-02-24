// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/modules/seats_screen/cubit/cubit.dart';
import 'package:graduation_project_app/modules/seats_screen/cubit/states.dart';
import 'package:graduation_project_app/modules/seats_screen/widgets/confirmation.dart';
import 'package:graduation_project_app/modules/seats_screen/widgets/selectItem.dart';
import 'package:graduation_project_app/modules/seats_screen/widgets/smalltrain.dart';
import 'package:graduation_project_app/modules/seats_screen/widgets/trainpart.dart';
import 'package:graduation_project_app/shared/components/appBar.dart';
import 'package:graduation_project_app/shared/components/button.dart';
import 'package:graduation_project_app/shared/components/toast.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:graduation_project_app/widgets/global.dart';

//colortheme

class Seats extends StatefulWidget {
  const Seats({
    super.key,
     required Map<String,dynamic> train,
  });

  @override
  State<Seats> createState() => _SeatsState();
}

class _SeatsState extends State<Seats> {
  List<SelectModel> selection = [
    SelectModel(text: 'Available', color: colortheme.lightGray),
    SelectModel(text: 'Booked', color: colortheme.saimon),
    SelectModel(text: 'Selected', color: colortheme.lightPurple),
  ];
  List<String> gateType = ['1A', '2A', '3B'];
  // @override
  // void initState() {
  //   globals.numberOfSeats.value = 0;
  //   globals.amountToBePayed.value = 0;
  //   globals.seats;
  //   //print(globals.seats);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SeatsScreenCubit()..initialFunction(),
      child: BlocConsumer<SeatsScreenCubit, SeatsScreenStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: bar(
              context: context,
              text: '',
              morelist: true,
              backgroundcolor: colortheme.blueGray,
              iconcolor: colortheme.black,
            ),
            body: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  padding: const EdgeInsets.all(18.0),
                  color: colortheme.blueGray,
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Choose Seats',
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 300,
                                          padding:
                                              const EdgeInsets.only(top: 30),
                                          child: ListView.separated(
                                              itemBuilder: (context, index) =>
                                                  Text(
                                                    gateType[index],
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        color: Color.fromARGB(
                                                            255, 95, 94, 94)),
                                                  ),
                                              separatorBuilder:
                                                  (context, index) =>
                                                      const SizedBox(
                                                        height: 80,
                                                      ),
                                              itemCount: gateType.length),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: smallTrain(),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Seats',
                                style: TextStyle(fontSize: 15),
                              ),
                              Row(
                                children: [
                                  Text(
                                    numberOfSeats <= 9
                                        ? ' 0$numberOfSeats'
                                        : ' ',
                                    style: const TextStyle(
                                        fontSize: 40,
                                        color: colortheme.lightPurple),
                                  ),
                                  Text(
                                    numberOfSeats <= 9 ? '/0$seats' : '/$seats',
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              const Text(
                                'Amount',
                                style: TextStyle(fontSize: 15),
                              ),
                              Row(
                                children: [
                                  Text(
                                    amountToBePayed <= 9
                                        ? '0$amountToBePayed'
                                        : '$amountToBePayed ',
                                    style: const TextStyle(
                                        fontSize: 40, color: colortheme.black),
                                  ),
                                  const Text(
                                    'EG',
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 120,
                              child: ListView.separated(
                                itemBuilder: (context, index) =>
                                    selectItem(selection[index]),
                                itemCount: selection.length,
                                scrollDirection: Axis.horizontal,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const SizedBox(
                                  width: 10,
                                ),
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Stack(
                                      alignment: AlignmentDirectional.topCenter,
                                      children: [
                                        Container(
                                          width: 170,
                                          height: 450,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(100),
                                                  topRight:
                                                      Radius.circular(100),
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20))),
                                          child: const MyWidget(start: 1),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 20),
                                          width: 140,
                                          height: 70,
                                          decoration: const BoxDecoration(
                                              color: colortheme.blueGray,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(100),
                                                  topRight:
                                                      Radius.circular(100))),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 170,
                                      height: 360,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: const MyWidget(start: 17),
                                    ),
                                    Stack(
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      children: [
                                        Container(
                                          width: 170,
                                          height: 450,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                  bottomLeft:
                                                      Radius.circular(100),
                                                  bottomRight:
                                                      Radius.circular(100))),
                                          child: const MyWidget(start: 33),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 35),
                                          width: 140,
                                          height: 70,
                                          decoration: const BoxDecoration(
                                              color: colortheme.blueGray,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(100),
                                                  bottomRight:
                                                      Radius.circular(100))),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: button(
                    height: 50,
                    onpress: () async {
                      if (selectedSeats.length == seats) {
                        
                        confirmSeats(context);
                      } else {
                        showToast(
                      state: ToastStates.error,
                      text: 'Select all seats!',
                    );
                      }
                    },
                    text: 'Confirm Seats',
                    width: 200,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
