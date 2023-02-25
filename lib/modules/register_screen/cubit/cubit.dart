import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/user.dart';
import 'package:graduation_project_app/modules/register_screen/cubit/states.dart';


class registerCubit extends Cubit<registerStates> {
  registerCubit() : super(registerInitialState());
  static registerCubit get(context)=> BlocProvider.of(context);
  void userRegister({
  required String firstName,
  required String secondName,
  required String email,
  required String pass,
}){
    emit(registerLoadinglState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass).then
      ((value) {
        print(value.user?.email);
        print(value.user?.uid);
        ///need data here uid ,phone,image
        createUser(name: '$firstName $secondName', email: email, uId: value.user!.uid);
        }).catchError(
            (error){
              print(error);
          emit(registerErrorState(error.toString()));
    });
  }
  void createUser({
  required String name,
  required String email,
  required String uId,  
}){
    UserModel model =UserModel(
      name: name,
      email: email,
      id: uId,
    );
    FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap()).then(
        (value)
            {
              emit(createUserSucessState());
            }
    ).catchError((error){
      print(error.toString());
      emit(createUserErrorState(error.toString()));
    });
  }
  bool isPass=true;
  bool conPass=true;
  void passtrue(){
    isPass=!isPass;
    emit(passIsVisibleState());
  }
  void passContrue(){
    conPass=!conPass;
    emit(passIsVisibleState());
  }
}