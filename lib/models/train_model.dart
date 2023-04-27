
class TrainModel {
  List stations = [];
  List Timetable = [];
  String trainNum = '';
  String trainID = '';
  Map<String, dynamic> available={};

  TrainModel(
    this.stations,
    this.Timetable,
    this.trainNum,
    this.trainID,
    this.available,
  );

  TrainModel.fromjson(Map<String, dynamic> json) {
    stations = json['stations'];
    Timetable = json['Timetable'];
    trainNum = json['trainNum'];
    trainID = json['trainID'];
    available = json['available'];
  }
  Map<String, dynamic> toMap() {
    return {
      'stations': stations,
      'Timetable': Timetable,
      'trainNum': trainNum,
      'trainID': trainID,
      'available': available,
    };
  }
}
