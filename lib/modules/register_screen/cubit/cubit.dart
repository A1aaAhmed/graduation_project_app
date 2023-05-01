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
    required String phone
}){
    emit(registerLoadinglState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass).then
      ((value) {

        value.user?.uid!=phone;
        print('استغفر الله العظيم');
        print(value.user?.email);
        print(value.user?.uid);
        createUser(name: '$firstName $secondName', email: email, uId: phone,phone: phone);
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
    required String phone

}){
    UserModel model =UserModel(
      name: name,
      email: email,
      uId: uId,
      phone: phone,
      bill: '0.0',
      image:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCx4ccalfApSkEYuRVPPOaHuBArgEUczsJKLsoofXozOerx-A-0rtEalHhLqfHuW3mi1A&usqp=CAU',
    );
    String start=phone.substring(0,3);
    FirebaseFirestore.instance.collection('users').doc(start)
        .collection('numbers').doc(phone).set(model.toMap()).then(
        (value)
            {
              emit(createUserSucessState(uId));
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