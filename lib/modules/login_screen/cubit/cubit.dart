import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/user.dart';
import 'package:graduation_project_app/modules/login_screen/cubit/states.dart';
import 'package:graduation_project_app/network/local/shared_pref.dart';

class loginCubit extends Cubit<loginStates> {
  loginCubit() : super(loginInitialState());
  static loginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String pass,
    required String phone,
  })  {
    emit(loginLoadinglState());

      FirebaseAuth.instance
        .signInWithEmailAndPassword(email: '$phone@gmail.com', password: pass)

    .then(
            (value) {
              // print('بيطبع ايه رقم التليفون');
              // print(value.user?.email);
              // print(value.user?.uid);
              emit(loginSucessState(phone));}).catchError(
            (error){
              print(error.toString());
              emit(loginErrorState(error.toString()));
            }
    );
  }

  bool isPass = true;
  void passtrue() {
    isPass = !isPass;
    emit(passIsVisibleState());
  }
}
