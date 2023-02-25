import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/home_screen/cubit/cubit.dart';
import 'package:graduation_project_app/modules/home_screen/cubit/states.dart';
import 'package:graduation_project_app/modules/trains_screen/traincard.dart';
import 'package:graduation_project_app/shared/components/appBar.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:intl/intl.dart';

import '../../shared/variables.dart';

class TrainsScreen extends StatelessWidget {
  TrainsScreen({
    super.key,
  });

  // final List data = [
  //   '10:00 am',
  //   '01:00 pm',
  //   '03:00 pm',
  //   '05:00 pm',
  //   '10:00 pm'
  // ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<HomeScreenCubit, HomeScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeScreenCubit cubit = HomeScreenCubit.get(context);
          return Scaffold(
            appBar: bar(
              context: context,
              text: '',
              morelist: false,
            ),
            body: Container(
              color: colortheme.lightPurple,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        '$from to $to',
                        style: const TextStyle(
                          color: colortheme.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        DateFormat.yMMMEd()
                            .format(DateTime.parse(depart))
                            .toString(),
                        style: const TextStyle(
                          color: colortheme.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: colortheme.white,
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(width * .1),
                            topEnd: Radius.circular(width * .1),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.08,
                        ),
                        child: ConditionalBuilder(
                          condition: cubit.searchedTrains.isNotEmpty && state is GetTrainsLoadingState,
                          builder: (context) => SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 35, left: 20, right: 20),
                                  child: Text(
                                    '${cubit.searchedTrains.length} Trains Found',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: ((context, index) {
                                    // print(",,,,,,,,,,,,,,,,,,,");
                                    // print("cur index");
                                    // print(index);
                                    // print(cubit.searchedTrains.length);
                                    // print(cubit.searchedTrains);
                                    return TrainCard(
                                      context: context,
                                      time: cubit.searchedTrains[index]['train']
                                              ['Timetable'][
                                          cubit.searchedTrains[index]
                                              ['fromindex']],
                                      trainNUM: cubit.searchedTrains[index]
                                          ['train']['trainNum'],
                                           train: cubit.searchedTrains[index]
                                          ['train'],
                                    );
                                  }),
                                  itemCount: cubit.searchedTrains.length,
                                ),
                              ],
                            ),
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator(color: colortheme.lightPurple,)),
                        ),
                      ),
                    ),
                  ]),
            ),
          );
        });
  }
}
