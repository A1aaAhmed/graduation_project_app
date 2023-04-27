import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation_project_app/models/user.dart';
import 'package:graduation_project_app/modules/social/cubit/states.dart';

class googleCubit extends Cubit<googleStates> {
  googleCubit() : super(googleInitialStates());
  static googleCubit get(context) => BlocProvider.of(context);
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    createGoogleUser(
        name: googleUser!.displayName!,
        email: googleUser!.email,
        uId: googleUser!.id);
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void createGoogleUser({
    required String name,
    required String email,
    required String uId,
  }) {
    UserModel model = UserModel(
      name: name,
      email: email,
      uId: uId,
      phone: '01xxxxxxxxx',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCx4ccalfApSkEYuRVPPOaHuBArgEUczsJKLsoofXozOerx-A-0rtEalHhLqfHuW3mi1A&usqp=CAU',
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(createGoogleUserSucessState(uId));
    }).catchError((error) {
      print(error.toString());
      emit(createGoogleUserErrorState(error.toString()));
    });
  }
}

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialStates());
  static AuthCubit get(context) => BlocProvider.of(context);

  late AuthCredential phoneAuthCredential;
  late String verificationId;
  late int code;
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  Future<void> submitPhoneNumber() async {
    /// NOTE: Either append your phone number country code or add in the code itself
    /// Since I'm in India we use "+91 " as prefix `phoneNumber`
    String phoneNumber = "+20 " + phoneController.text.toString().trim();
    print(phoneNumber);

    /// The below functions are the callbacks, separated so as to make code more redable
    void verificationCompleted(AuthCredential phoneAuthCredential) {
      print('verificationCompleted');

      phoneAuthCredential = phoneAuthCredential;
      print(phoneAuthCredential);
      emit(VerificationSuccessState());
    }

    void verificationFailed(error) {
          print(error.toString());
      emit(VerificationErrorState(error.toString()));
    }

    void codeSent(String verificationId, [int? code]) {
      print('codeSent');

      verificationId = verificationId;
      print(verificationId);
      code = code;
      print(code.toString());
      emit(CodeSentState());
    }

    void codeAutoRetrievalTimeout(String verificationId) {
      print(verificationId);
      emit(TimeoutState());
    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      /// Make sure to prefix with your country code
      phoneNumber: phoneNumber,

      /// `seconds` didn't work. The underlying implementation code only reads in `millisenconds`
      timeout: Duration(milliseconds: 10000),

      /// If the SIM (with phoneNumber) is in the current device this function is called.
      /// This function gives `AuthCredential`. Moreover `login` function can be called from this callback
      /// When this function is called there is no need to enter the OTP, you can click on Login button to sigin directly as the device is now verified
      verificationCompleted: verificationCompleted,

      /// Called when the verification is failed
      verificationFailed: verificationFailed,

      /// This is called after the OTP is sent. Gives a `verificationId` and `code`
      codeSent: codeSent,

      /// After automatic code retrival `tmeout` this function is called
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void submitOTP()  {
    String smsCode = otpController.text.toString().trim();

    /// when used different phoneNumber other than the current (running) device
    /// we need to use OTP to get `phoneAuthCredential` which is inturn used to signIn/login
    phoneAuthCredential =  PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
         FirebaseAuth.instance
        .signInWithCredential(phoneAuthCredential)
        .then((authRes) {
      emit(LoginSuccessState());
      // _firebaseUser = authRes.user;
      // print(_firebaseUser.toString());
    }).catchError((e) {
      emit(LoginErrorState(e));
    });
  }

 
}
