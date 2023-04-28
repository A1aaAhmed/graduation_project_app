import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/searchedtrain_model.dart';

import 'package:graduation_project_app/modules/home_screen/cubit/states.dart';


import '../../../models/train_model.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenIntialState());

  static HomeScreenCubit get(context) => BlocProvider.of(context);

  List<Map<String, dynamic>> trains = [];
  List<Map<String, dynamic>> searchedTrains = [];
  int fromIndex = 0;
  int toIndex = 0;
  bool frstStation = false;
  bool scndStation = false;

  Future<void> getTrainsAndSearch(String from, String to) async {
    trains = [];
    searchedTrains = [];
    emit(GetTrainsLoadingState());
    FirebaseFirestore.instance
        .collection('trains')
        .where("stations", arrayContains: from)
        .get()
        .then((value) {
      value.docs.forEach((train) {
        trains.add(TrainModel.fromjson(train.data()).toMap());
      });
      trains.forEach((train) {
        fromIndex = 0;
        toIndex = 0;
        frstStation = false;
        scndStation = false;
        int length = train['stations'].length;
        for (int i = 0; i < length; i++) {
          if (frstStation == false) {
            if (train['stations'][i] == from) {
              fromIndex = i;
              frstStation == true;
            }
          }
          if (scndStation == false) {
            if (train['stations'][i] == to) {
              toIndex = i;
              scndStation == true;
            }
          }
        }
        if (fromIndex < toIndex &&
            train['available'][
                    DateFormat.E().format(DateTime.parse(depart)).toString()] !=
                '0') {
          searchedTrains.add(SearchedTrain(fromIndex, toIndex, train).toMap());
        }
      });
      emit(GetTrainsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetTrainsErrorState(error.toString()));
    });
  }

  // Future<void> getTrains() async {
  //   if (trains.length == 0) {
  //     emit(GetTrainsLoadingState());
  //     FirebaseFirestore.instance.collection('trains').get().then((value) {
  //       value.docs.forEach((train) {
  //         trains.add(TrainModel.fromjson(train.data()).toMap());
  //         // print(train.data());
  //         // print("======================================");
  //       });
  //     }).catchError((error) {
  //       GetTrainsErrorState(error.toString());
  //     });
  //     // print(trains.length);
  //     // print("======================================");
  //     emit(GetTrainsSuccessState());
  //   }
  // }

  // Future<void> SearchForTrains(String from, String to) async {
  //   // trains = [];
  //   searchedTrains = [];
  //   emit(SearchTrainsLoadingState());
  //   // FirebaseFirestore.instance
  //   //     .collection('trains')
  //   //     .where("stations", arrayContains: from)
  //   //     .get()
  //   //     .then((value) {
  //   //   value.docs.forEach((train) {
  //   //     trains.add(TrainModel.fromjson(train.data()).toMap());
  //   //     // print(train.data());
  //   //     // print("======================================");
  //   //   });
  //   trains.forEach((train) {
  //     fromIndex = 0;
  //     toIndex = 0;
  //     frstStation = false;
  //     scndStation = false;
  //   //  print(train);
  //     int length = train['stations'].length;
  //    // print(length);
  //     for (int i = 0; i < length; i++) {
  //       if (frstStation == false) {
  //         if (train['stations'][i] == from) {
  //           fromIndex = i;
  //         //  print(fromIndex);
  //           frstStation = true;
  //         //  print(frstStation);
  //         }
  //       }
  //     }
  //     if (frstStation == true) {
  //       for (int i = fromIndex; i < length; i++) {
  //         if (scndStation == false) {
  //           if (train['stations'][i] == to) {
  //             toIndex = i;
  //           //  print(toIndex);
  //             scndStation = true;
  //           }
  //         }
  //       }
  //     }
  //     if (scndStation == true) {
  //       searchedTrains.add(SearchedTrain(fromIndex, toIndex, train).toMap());
  //     }
  //     // if (fromIndex < toIndex) {
  //     //   // print("added trainnnnnnnnnn");
  //     //   // print(train);
  //     //   // print("=================");
  //     //   searchedTrains.add(SearchedTrain(fromIndex, toIndex, train).toMap());
  //     // }
  //   });
  //   // print('searched trains');
  //   // print(searchedTrains);
  //   // print(searchedTrains.length);
  //   // print(
  //   //     "/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////");
  //   emit(SearchTrainsSuccessState());
  // }
/////////////////////////////////////////////////////
}
