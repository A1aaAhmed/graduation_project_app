import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/user.dart';
import 'package:graduation_project_app/modules/register_screen/cubit/states.dart';

class registerCubit extends Cubit<registerStates> {
  registerCubit() : super(registerInitialState());
  static registerCubit get(context) => BlocProvider.of(context);

  Future<void> userRegister(
      {required String? name,
      required String? email,
      required String? pass,
      required String? phone}) async {
    emit(registerLoadinglState());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: "$phone@gmail.com",
        password: pass!,
      );
      createUser(name: name, email: email, phone: phone);
    } catch (error) {
      print(error.toString());
      emit(registerErrorState(error.toString()));
    }
  }

  void createUser({
    required String? name,
    required String? email,
    required String? phone,
  }) {
    UserModel model = UserModel(
      name: name,
      email: email,
      uId: phone,
      bill: '0.0',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCx4ccalfApSkEYuRVPPOaHuBArgEUczsJKLsoofXozOerx-A-0rtEalHhLqfHuW3mi1A&usqp=CAU',
    );
    String start = phone!.substring(0, 3);
    FirebaseFirestore.instance
        .collection('users')
        .doc(start)
        .collection('numbers')
        .doc(phone)
        .set(model.toMap())
        .then((value) {
      emit(createUserSucessState(phone));
    }).catchError((error) {
      print(error.toString());
      emit(createUserErrorState(error.toString()));
    });
  }

  bool isPass = true;
  bool conPass = true;

  void passtrue() {
    isPass = !isPass;
    emit(isPassIsVisibleState());
            print('===========');

        print(isPass);

  }

  void passContrue() {
    conPass = !conPass;
    emit(passIsVisibleState());
  }

  static Future<bool> searchNumber({
    required String number,
  }) async {
    try {
      String start = number.substring(0, 3);
      var snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(start)
          .collection('numbers')
          .doc(number)
          .get();

      return snapshot.exists;
    } catch (e) {
      // If any error
      return false;
    }
  }
}
