import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation_project_app/models/user.dart';
import 'package:graduation_project_app/modules/social/cubit/states.dart';

class googleCubit  extends Cubit<googleStates>{
  googleCubit():super(googleInitialStates());
  static googleCubit get(context) => BlocProvider.of(context);
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;


    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    createGoogleUser(name: googleUser!.displayName!, email:googleUser.email, uId: googleUser.id);
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  void createGoogleUser({
    required String name,
    required String email,
    required String uId,

  }){
    UserModel model =UserModel(
      name: name,
      email: email,
      uId: uId,
      phone: '01xxxxxxxxx',
      image:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCx4ccalfApSkEYuRVPPOaHuBArgEUczsJKLsoofXozOerx-A-0rtEalHhLqfHuW3mi1A&usqp=CAU',
    );
    FirebaseFirestore.instance.collection('users').doc(uId.toString().substring(0,3))
        .collection('numbers').doc(uId).set(model.toMap()).then(
            (value)
        {
          emit(createGoogleUserSucessState(uId));
        }
    ).catchError((error){
      print(error.toString());
      emit(createGoogleUserErrorState(error.toString()));
    });
  }
}