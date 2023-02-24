import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/home_screen/cubit/states.dart';
import 'package:graduation_project_app/shared/variables.dart';

import '../../../models/train_model.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenIntialState());

  static HomeScreenCubit get(context) => BlocProvider.of(context);

  void getdata() {
    if (trains.isEmpty) {
      emit(GetTrainsLoadingState());
      FirebaseFirestore.instance.collection('trains').get().then((value) {
        value.docs.forEach((element) {
          trains.add(TrainModel.fromjson(element.data()).toMap());
        });
        print(trains.length);
        print(
            "/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////");
        emit(GetTrainsSuccessState());
      }).catchError((error) {
        emit(GetTrainsErrorState(error.toString()));
      });
    }
    ;
  }
}
