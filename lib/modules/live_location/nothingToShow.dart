import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_app/layout/cubit/cubit.dart';
import 'package:graduation_project_app/layout/transition.dart';
import 'package:graduation_project_app/modules/Ticket/timeFuns.dart';
import 'package:graduation_project_app/modules/live_location/livelocation_screen.dart';
import 'package:graduation_project_app/shared/variables.dart';
import 'package:intl/intl.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:sizer/sizer.dart';
class NothingScreen extends StatelessWidget {
  final DateTime date;
  final bool isEmpty;
  final bool isFromHomeScreen;
  final String station;
  final bool nothing;
  final String trainNump;
  const NothingScreen({
    required this.date,
    required this.trainNump,
    required this.isEmpty,
    required this.isFromHomeScreen,
    required this.station,
    required this.nothing,
    super.key
  });
  @override
  Widget build(BuildContext context) {
    String dateToShow=(!isEmpty ||!isFromHomeScreen)
        ?isToday(date)?"Today at ${DateFormat('hh:mm a', 'en_US').format(date)}"
        :"at ${DateFormat().format(date)}":"";
    return Scaffold(
            body:  SizedBox(
              height: 100.h,
              width: 100.w,
              child:ConditionalBuilder(
                      condition: !nothing&&(!isFromHomeScreen||isFromHomeScreen&&availableTicket.isNotEmpty),
                      builder: (context) =>isToday(date)?Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height:15.h,
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            child: Text( "Wait for the train\nThe train will arrive $station $dateToShow",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color:colortheme.lightPurple ,
                                fontWeight: FontWeight.bold,fontSize: 18
                            )
                            ),
                          ),
                         SizedBox(
                            height: 85.h,
                              child: LiveLocationScreen(trainNump: trainNump,)
                          )
                        ],
                      ):Center(
                        child: Text(
                            "The train will arrive $station $dateToShow",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color:colortheme.lightPurple ,
                                fontWeight: FontWeight.bold,fontSize: 18
                            )
                        ),
                      ),
                      fallback: (context) => SizedBox(
                        width: 100.w,
                        height: 100.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Text("Nothing to Show",
                               style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                   color:Colors.grey,
                               )
                           ),
                            TextButton(
                              onPressed:(){
                                MainCubit Cubit = MainCubit.get(context);
                                Cubit.changeNavbarIndex(0);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>const Trans())));
                            }, child: Text("Book your trip",
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color:colortheme.lightPurple ,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                              )
                          ],
                        ),
                      ),
                    ),
                ));

          }

  }

