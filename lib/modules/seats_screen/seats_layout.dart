// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/seats_screen/cubit/cubit.dart';
import 'package:graduation_project_app/modules/seats_screen/cubit/states.dart';
import 'package:graduation_project_app/modules/seats_screen/widgets/classesmodel.dart';
import 'package:graduation_project_app/modules/seats_screen/widgets/confirmation.dart';
import 'package:graduation_project_app/modules/seats_screen/widgets/selectitem_model.dart';
import 'package:graduation_project_app/modules/seats_screen/widgets/smalltrain.dart';
import 'package:graduation_project_app/modules/seats_screen/widgets/themaintrain.dart';
import 'package:graduation_project_app/shared/components/button.dart';
import 'package:graduation_project_app/shared/components/toast.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:graduation_project_app/shared/variables.dart';

//colortheme

class Seats extends StatefulWidget {
  final Map<String, dynamic> train;
  final String time;
  final String trainNUM;
  const Seats({
    super.key,
    required this.train,
    required this.time,
    required this.trainNUM,
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

  @override
  Widget build(BuildContext context) {
    classType = [
      TrainClassesModel(
          className: '1st class',
          price: widget.train['trainClasses']['1st class']),
      TrainClassesModel(
          className: 'Business ',
          price: widget.train['trainClasses']['Business class']),
      TrainClassesModel(
          className: 'Economy ',
          price: widget.train['trainClasses']['Economy class']),
    ];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => SeatsScreenCubit()
        ..initialFunction()
        ..getSeats(widget.train['trainID']),
      child: BlocConsumer<SeatsScreenCubit, SeatsScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ConditionalBuilder(
            condition: allSeats.isNotEmpty,
            builder: (context) => Scaffold(
              appBar: AppBar(
                backgroundColor: colortheme.blueGray,
                iconTheme: const IconThemeData(
                  color: colortheme.lightPurple,
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
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
                          width: width * 0.33,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Choose Seats',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      )),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            // mainAxisAlignment:
                                            //     MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: height * 0.3,
                                                padding: EdgeInsets.only(
                                                    top: height * 0.025),
                                                child: ListView.separated(
                                                    itemBuilder: (context,
                                                            index) =>
                                                        Text(
                                                            classType[index]
                                                                .className,
                                                            style: Theme
                                                                    .of(context)
                                                                .textTheme
                                                                .bodySmall),
                                                    separatorBuilder: (context,
                                                            index) =>
                                                        SizedBox(
                                                          height:
                                                              height * 0.062,
                                                        ),
                                                    itemCount:
                                                        classType.length),
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: smallTrain(
                                              width: width, height: height),
                                        ),
                                      ],
                                    ),
                                    Text('Seats',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    Row(
                                      children: [
                                        Text(
                                            numberOfSeats <= 9
                                                ? ' 0$numberOfSeats'
                                                : ' $numberOfSeats',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                    fontSize: 34,
                                                    color: colortheme
                                                        .lightPurple)),
                                        Text(
                                            noOfChoosenSeats <= 9
                                                ? '/0$noOfChoosenSeats'
                                                : '/$noOfChoosenSeats',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * 0.005,
                                    ),
                                    Text('Amount',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          Text(
                                              amountToBePayed <= 9
                                                  ? '0$amountToBePayed '
                                                  : '$amountToBePayed ',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                    fontSize: 34,
                                                  )),
                                          Text('EG',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium)
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                width: width * 0.089,
                              ),
                              Container(
                                height: height * 0.18,
                                child: ListView.builder(
                                  itemBuilder: (context, index) =>
                                      selectItem(selection[index], context),
                                  itemCount: selection.length,
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: TheMainTrain(height: height, width: width,)),
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
                        if (selectedSeats.length == noOfChoosenSeats) {
                          confirmSeats(
                            context,
                            widget.time,
                            widget.trainNUM,
                            widget.train,
                          );
                        } else {
                          showToast(
                            state: ToastStates.error,
                            text: 'Select all seats!',
                          );
                        }
                      },
                      text: 'Confirm Seats',
                      width: 200,
                      context: context,
                    ),
                  )
                ],
              ),
            ),
            fallback: (context) => const Center(
                child: CircularProgressIndicator(
              color: colortheme.lightPurple,
            )),
          );
        },
      ),
    );
  }
}
