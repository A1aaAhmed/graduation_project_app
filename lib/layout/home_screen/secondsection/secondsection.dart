import 'package:flutter/material.dart';
import 'package:graduation_project_app/layout/home_screen/secondsection/text_form.dart';
import 'package:graduation_project_app/modules/trains_screen/trains_screen.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:graduation_project_app/shared/components/button.dart';
import 'package:graduation_project_app/shared/variables.dart';

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
 // int travellers = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                        formfield(
                          label: 'From where?',
                          controller: from,
                          msg: "Enter your location, Please",
                        ),
                        formfield(
                          label: 'Where to?',
                          controller: to,
                          msg: "Enter your destination, Please",
                        ),
                        formfield(
                          label: 'Departure date',
                          hint: '26 Sept, 2022',
                          controller: depart,
                          msg: "Enter the Date, Please",
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Travellers',
                                style: TextStyle(
                                  color: colortheme.lightPurple,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: width * 0.09,
                                    height: width * 0.09,
                                    decoration: BoxDecoration(
                                        color: colortheme.lightGray,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(width * .03),
                                        )),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (travellers == 0) {
                                            travellers = 0;
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
                                    '$travellers',
                                    style: const TextStyle(
                                      color: colortheme.black,
                                      fontSize: 25,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  Container(
                                    width: width * 0.09,
                                    height: width * 0.09,
                                    decoration: BoxDecoration(
                                        color: colortheme.lightGray,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(width * .03),
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
                            onpress: () {
                              if (formkey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => TrainsScreen(
                                          from: from.text,
                                          to: to.text,
                                          date: depart.text)),
                                    ));
                              }
                            }),
                      ]),
                ))));
  }
}
