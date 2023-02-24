import 'package:flutter/material.dart';
import 'package:graduation_project_app/shared/components/appBar.dart';
import 'package:sizer/sizer.dart';

import 'ListTable.dart';

class MyTripsScreen extends StatefulWidget {
  const MyTripsScreen({super.key});

  @override
  State<MyTripsScreen> createState() => _MyTripsState();
}

class _MyTripsState extends State<MyTripsScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Sizer(
        builder: (context, orientation, deviceType) {

          return Scaffold(
              appBar: bar(
              context: context,
              text: 'Previous Tickets',
              morelist: true,
          ),
              body:ListTable(
                h:40.h,
                w:100.w,
               ));
  }),
    );
  }
}
