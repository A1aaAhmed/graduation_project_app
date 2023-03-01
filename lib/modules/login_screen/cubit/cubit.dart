import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/login_screen/cubit/states.dart';
import 'package:graduation_project_app/network/local/shared_pref.dart';

class loginCubit extends Cubit<loginStates> {
  loginCubit() : super(loginInitialState());
  static loginCubit get(context)=> BlocProvider.of(context);
  void userLogin({
  required String pass,
  required String email,
}){

    emit(loginLoadinglState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass).then(
            (value) {
              print(value.user?.email);
              print(value.user?.uid);
              emit(loginSucessState(value.user!.uid));}).catchError(
            (error){
              print(error.toString());
              emit(loginErrorState(error.toString()));
            }
    );
}
  bool isPass=true;
  void passtrue(){
    isPass=!isPass;
    emit(passIsVisibleState());
  }
}