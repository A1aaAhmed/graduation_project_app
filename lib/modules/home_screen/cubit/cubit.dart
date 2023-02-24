import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/searchedtrain_model.dart';
import 'package:graduation_project_app/modules/home_screen/cubit/states.dart';
import 'package:graduation_project_app/modules/home_screen/secondsection/text_form.dart';
import 'package:graduation_project_app/shared/variables.dart';

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
 Future <void> getTrainsAndSearch(String from, String to) async{

    emit(GetTrainsLoadingState());
    FirebaseFirestore.instance
        .collection('trains')
        .where("stations", arrayContains: from)
        .get()
        .then((value) {
      value.docs.forEach((train) {
        trains.add(TrainModel.fromjson(train.data()).toMap());
        // print(train.data());
        // print("======================================");
      });
      trains.forEach((train) {
        fromIndex = 0;
        toIndex = 0;
        frstStation = false;
        scndStation = false;
      //  print(train);
        int length = train['stations'].length;
       // print(length);
        for (int i = 0; i < length; i++) {
          if (frstStation == false) {
            if (train['stations'][i] == from) {
              fromIndex = i;
              print(fromIndex);
              frstStation == true;
            }
          }
          if (scndStation == false) {
            if (train['stations'][i] == to) {
              toIndex = i;
              print(toIndex);
              scndStation == true;
            }
          }
        }
        if (fromIndex < toIndex) {
          // print("added trainnnnnnnnnn");
          // print(train);
          // print("=================");
          searchedTrains.add(SearchedTrain(fromIndex, toIndex, train).toMap());
        }
      });
      print('searched trains');
      print(searchedTrains);
      print(searchedTrains.length);
      print(
          "/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////");
      emit(GetTrainsSuccessState());
    }).catchError((error) {
      emit(GetTrainsErrorState(error.toString()));
    });
  }
}
