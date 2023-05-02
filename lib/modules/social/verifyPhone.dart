import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/transition.dart';
import 'package:graduation_project_app/modules/register_screen/cubit/cubit.dart';
import 'package:graduation_project_app/modules/register_screen/cubit/states.dart';
import 'package:graduation_project_app/shared/components/components.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:graduation_project_app/shared/variables.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:graduation_project_app/network/local/shared_pref.dart';

class verifyPhoneScreen extends StatelessWidget {
  final String? phone;
  final String? name;
  final String? email;
  final String? pass;
  verifyPhoneScreen(this.phone, this.name, this.email, this.pass);

  @override
  Widget build(BuildContext context) {
    OtpFieldController otpController = OtpFieldController();
    return BlocProvider(
      create: (contextt) => registerCubit(),
      child: BlocConsumer<registerCubit, registerStates>(
        listener: (BuildContext context, registerStates state) {
      // if (state is createUserErrorState) {
      //   showToast(text: state.error.toString(), status: toastStates.ERROR);
      // }
      // if (state is createUserSucessState) {
      //   showToast(
      //       text: 'you have sucessfully signed up', status: toastStates.SUCESS);
      //   casheHelper.saveData(key: 'uId', value: state.uId).then((value) {
      //     Navigator.push(context,
      //         MaterialPageRoute(builder: ((context) => const Trans())));
      //   });
      // }
    }, builder: (BuildContext context, registerStates state) {
      registerCubit cubit = registerCubit.get(context);
      print('verfiviiittionnnnn');
      return Scaffold(
        appBar: AppBar(
          backgroundColor: colortheme.lightGray,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: colortheme.lightPurple,
            ),
            onPressed: () {},
          ),
          title: Center(
            child: Text(
              'verify phone number',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'code is sent to $phone',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(
                  height: 40,
                ),
                OTPTextField(
                  controller: otpController,
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 45,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 15,
                  style: const TextStyle(fontSize: 17),
                  onChanged: (pin) {
                    print("Changed: " + pin);
                    userOpt = pin;
                  },
                  onCompleted: (pin) {
                    userOpt = pin;
                    print("Completeddddddddddddddddddddddddddddddddddd: " +
                        userOpt);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                defultButton(
                    background: colortheme.lightPurple,
                    function: () async {
                      print(userOpt);
                      print("jjjjjjjjjjjjjjjjjjj" + realOpt);

                      try {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: realOpt, smsCode: userOpt);

                        await FirebaseAuth.instance
                            .signInWithCredential(credential);
                        if (pass == '0') {
                         
                          cubit.createUser(
                              name: name, email: email, phone: phone);
                              
                        } else {
                          registerCubit.get(context).userRegister(
                              name: name,
                              phone: phone,
                              email: email,
                              pass: pass);}
                          casheHelper
                              .saveData(key: 'uId', value: phone)
                              .then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => const Trans())));
                          });
                        
                      } catch (e) {
                        print("wronnnnnnnnnnnnnnnnnnnnnng");
                        print(e);
                      }

                      // cubit.submitOTP();
                      // // PhoneAuthCredential credential= PhoneAuthProvider.credential(verificationId: widget.verificationId!, smsCode:otpController.toString() );
                      // // await FirebaseAuth.instance.signInWithCredential(credential);
                      // if(FirebaseAuth.instance.currentUser != null){
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: ((context) =>  const welcomeScreen()),
                      //       )
                      //   );
                      // }
                    },
                    text: 'verify and create account',
                    context: context),
              ]),
        ),
      );
    }));
  }
}
