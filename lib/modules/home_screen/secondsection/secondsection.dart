import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/searchedtrain_model.dart';
import 'package:graduation_project_app/modules/home_screen/cubit/cubit.dart';
import 'package:graduation_project_app/modules/home_screen/cubit/states.dart';
import 'package:graduation_project_app/modules/home_screen/secondsection/dropdownform.dart';
import 'package:graduation_project_app/modules/home_screen/secondsection/text_form.dart';
import 'package:graduation_project_app/modules/trains_screen/trains_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:graduation_project_app/shared/components/button.dart';
import 'package:graduation_project_app/shared/variables.dart';
import 'package:graduation_project_app/widgets/global.dart' as globals;
import 'package:intl/intl.dart';

import '../../../models/train_model.dart';

class SecondSection extends StatefulWidget {
  const SecondSection({super.key});

  @override
  State<SecondSection> createState() => _SecondSectionState();
}

class _SecondSectionState extends State<SecondSection> {
  //TextEditingController from = TextEditingController();
  //TextEditingController to = TextEditingController();
  // TextEditingController depart = TextEditingController();
  var formkey = GlobalKey<FormState>();
  int travellers = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
        listener: (context, HomeScreenStates) {},
        builder: (context, HomeScreenStates) {
          HomeScreenCubit cubit = HomeScreenCubit.get(context);
          return Positioned(
              top: height * 0.22,
              left: width * 0.05,
              child: Container(
                  width: width * .9,
                  height: height * 0.65,
                  decoration: BoxDecoration(
                      color: colortheme.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(width * .05),
                      )),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: formkey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              dropdownform(
                                countries,
                                "Enter your location, Please",
                                'From where?',
                                context,
                              ),
                              dropdownform(
                                countries,
                                "Enter your destination, Please",
                                'Where to?',
                                context,
                              ),
                              dropdownform(dates, "Enter the Date, Please",
                                  'Departure date', context),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Travellers',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: colortheme.lightPurple,
                                          ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: const BoxDecoration(
                                              color: colortheme.lightGray,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              )),
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                if (travellers == 1) {
                                                  travellers = 1;
                                                } else {
                                                  travellers--;
                                                }
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.remove,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Text(
                                            // '$travellers',
                                            '${travellers}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium),
                                        SizedBox(
                                          width: width * 0.02,
                                        ),
                                        Container(
                                          width: 50,
                                          height: 50,
                                          decoration: const BoxDecoration(
                                              color: colortheme.lightGray,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              )),
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  travellers++;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.add,
                                                size: 20,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ]),
                              button(
                                  text: 'Search Trains',
                                  width: width * 0.5,
                                  height: 60,
                                  context: context,
                                  onpress: () {
                                    if (formkey.currentState!.validate()) {
                                      globals.seats = travellers;
                                      cubit
                                          .getTrainsAndSearch(from, to)
                                          .then((value) {
                                        print(';;;;;;;;;;;;;;;;;;;;;;');
                                        print(cubit.searchedTrains);
                                        print(cubit.searchedTrains.length);

                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: ((context) =>
                                                  TrainsScreen()),
                                            ));
                                      }).catchError((onError) {
                                        onError.toString();
                                      });
                                    }
                                    ;
                                  })
                            ]),
                      ))));
        });
  }
}

const List<DropdownMenuItem<String>> countries = [
  DropdownMenuItem(value: "Cairo", child: Text("Cairo")),
  DropdownMenuItem(value: "Giza", child: Text("Giza")),
  DropdownMenuItem(value: "Alexandria", child: Text("Alexandria")),
  DropdownMenuItem(value: "Asyut", child: Text("Asyut")),
  DropdownMenuItem(value: "Al Balyana", child: Text("Al Balyana")),
  DropdownMenuItem(value: "Qena", child: Text("Qena")),
  DropdownMenuItem(value: "Luxor", child: Text("Luxor")),
  DropdownMenuItem(value: "Isna", child: Text("Isna")),
  DropdownMenuItem(value: "Edfu", child: Text("Edfu")),
  DropdownMenuItem(value: "Kom Ombo", child: Text("Kom Ombo")),
  DropdownMenuItem(value: "Aswan", child: Text("Aswan")),
  DropdownMenuItem(value: "El Alamein", child: Text("El Alamein")),
  DropdownMenuItem(value: "Mersa Matruh", child: Text("Mersa Matruh")),
  DropdownMenuItem(value: "Port Said", child: Text("Port Said")),
  DropdownMenuItem(value: "Suez", child: Text("Suez")),
];
List<DropdownMenuItem<String>> dates = [
  DropdownMenuItem(
      value: DateTime.now().add(Duration(days: 1)).toString(),
      child: Text(DateFormat.yMMMEd()
          .format(DateTime.now().add(Duration(days: 1)))
          .toString())),
  DropdownMenuItem(
      value: DateTime.now().add(Duration(days: 2)).toString(),
      child: Text(DateFormat.yMMMEd()
          .format(DateTime.now().add(Duration(days: 2)))
          .toString())),
  DropdownMenuItem(
      value: DateTime.now().add(Duration(days: 3)).toString(),
      child: Text(DateFormat.yMMMEd()
          .format(DateTime.now().add(Duration(days: 3)))
          .toString())),
  DropdownMenuItem(
      value: DateTime.now().add(Duration(days: 4)).toString(),
      child: Text(DateFormat.yMMMEd()
          .format(DateTime.now().add(Duration(days: 4)))
          .toString())),
  DropdownMenuItem(
      value: DateTime.now().add(Duration(days: 5)).toString(),
      child: Text(DateFormat.yMMMEd()
          .format(DateTime.now().add(Duration(days: 5)))
          .toString())),
  DropdownMenuItem(
      value: DateTime.now().add(Duration(days: 6)).toString(),
      child: Text(DateFormat.yMMMEd()
          .format(DateTime.now().add(Duration(days: 6)))
          .toString())),
  DropdownMenuItem(
      value: DateTime.now().add(Duration(days: 7)).toString(),
      child: Text(DateFormat.yMMMEd()
          .format(DateTime.now().add(Duration(days: 7)))
          .toString())),
];



// Map<String, dynamic> train = {
//   'stations': ['Cairo', 'Giza', 'Asyut', 'Al Balyana', 'Qena', 'Luxor'],
//   'Timetable': [
//     '12:15 pm',
//     '12:40 am',
//     '07:05 pm',
//     '09:45 pm',
//     '11:40 pm',
//     '12:40 am',
//   ],
//   'trainNum': '160',
//   'trainID': '',
// };
// List<bool> seatts = List.filled(48, false);

// Map<String, dynamic> seats = {
//   'Saturday': seatts,
//   'Sunday': seatts,
//   'Monday': seatts,
//   'Tuesday': seatts,
//   'Wednesday': seatts,
//   'Thursday': seatts,
//   'Friday': seatts,
// };
// void addtrains(Map<String, dynamic> train) {
//   FirebaseFirestore.instance.collection("trains").add(train);
// }

// void addseats(seats) {
//   FirebaseFirestore.instance
//       .collection("trains")
//       .doc('sGqWFjS3syqizW4EZlVY')
//       .collection('seats')
//       .add(seats);
// }
