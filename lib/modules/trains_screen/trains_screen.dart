import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/trains_screen/traincard.dart';
import 'package:graduation_project_app/shared/components/appBar.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:intl/intl.dart';

import '../../shared/variables.dart';

class TrainsScreen extends StatelessWidget {
  final String from;
  final String to;
  final String date;

  TrainsScreen({
    super.key,
    required this.from,
    required this.to,
    required this.date,
  });

  final List data = [
    '10:00 am',
    '01:00 pm',
    '03:00 pm',
    '05:00 pm',
    '10:00 pm'
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: bar(
        context: context,
        text: '',
        morelist: false,
      ),
      body: Container(
        color: colortheme.lightPurple,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.only(left: 25),
            child:Text(
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
              DateFormat.yMMMEd().format(DateTime.parse(depart)).toString(),
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 35, left: 20, right: 20),
                      child: Text(
                        '${data.length} Trains Found',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: ((context, index) => TrainCard(
                            context: context,
                            data: data[index],
                            from: from,
                            to: to,
                          )),
                      itemCount: data.length,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
