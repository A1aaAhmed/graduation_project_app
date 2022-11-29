import 'package:flutter/material.dart';
import 'package:graduation_project_app/layout/appBar.dart';

import '../component/ListTable.dart';


class MyTrips extends StatefulWidget {
  @override
  State<MyTrips> createState() => _MyTripsState();
}

class _MyTripsState extends State<MyTrips> {
  List<Map> db = [
    { 'tripName'  : 'alaa',
    'tripDate' : '25/5/2025',
    'extraData'  : 'hhhhhhhehee'
  },
    { 'tripName'  : 'alaa',
      'tripDate' : '25/5/2025',
      'extraData'  : 'hhhhhhhehee'
    },
    { 'tripName'  : 'alaa',
      'tripDate' : '25/5/2025',
      'extraData'  : 'hhhhhhhehee'
    },
    { 'tripName'  : 'alaa',
      'tripDate' : '25/5/2025',
      'extraData'  : 'hhhhhhhehee'
    },
    { 'tripName'  : 'alaa',
      'tripDate' : '25/5/2025',
      'extraData'  : 'hhhhhhhehee'
    },
    { 'tripName'  : 'alaa',
      'tripDate' : '25/5/2025',
      'extraData'  : 'hhhhhhhehee'
    },
    { 'tripName'  : 'alaa',
      'tripDate' : '25/5/2025',
      'extraData'  : 'hhhhhhhehee'
    },
    { 'tripName'  : 'alaa',
      'tripDate' : '25/5/2025',
      'extraData'  : 'hhhhhhhehee'
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(text: 'My Trips',),
      body: SingleChildScrollView(
        child: ListTable(list: db,icon:Icons.train_rounded,firstData: 'tripName',secondData: 'tripDate',thirdData: 'extraData'),
      ),

    );
  }
}
