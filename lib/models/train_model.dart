import 'package:flutter/material.dart';

class TrainModel {
   List stations=[];
   List Timetable=[];
   String trainNum='';
   String trainID='';

  TrainModel(
    this.stations,
    this.Timetable,
    this.trainNum,
    this.trainID,
  );

  TrainModel.fromjson(Map<String, dynamic> json) {
    stations = json['stations'];
    Timetable = json['Timetable'];
    trainNum = json['trainNum'];
    trainID = json['trainID'];
  }
  Map<String, dynamic> toMap() {
    return {
      'stations': stations,
      'Timetable': Timetable,
      'trainNum': trainNum,
      'trainID': trainID,
    };
  }
}
