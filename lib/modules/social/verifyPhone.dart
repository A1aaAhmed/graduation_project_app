import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/social/welcome_screen.dart';
import 'package:graduation_project_app/shared/components/components.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class verifyPhoneScreen extends StatefulWidget {
  verifyPhoneScreen();

  @override
  State<verifyPhoneScreen> createState() => _verifyPhoneScreenState();
}

class _verifyPhoneScreenState extends State<verifyPhoneScreen> {
  @override
  Widget build(BuildContext context) {
    OtpFieldController otpController = OtpFieldController();
    return BlocConsumer<AuthCubit, AuthStates>(
        listener: (BuildContext context, AuthStates state) {},
        builder: (BuildContext context, AuthStates state) {
          AuthCubit cubit = AuthCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: colortheme.lightGray,
              leading: IconButton(
                icon: Icon(
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
                      'code is sent to 0000000000',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                          ),
                    ),
                    SizedBox(
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
                        style: TextStyle(fontSize: 17),
                        onChanged: (pin) {
                          print("Changed: " + pin);
                        },
                        onCompleted: (pin) {
                          print("Completed: " + pin);
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    defultButton(
                        background: colortheme.lightPurple,
                        function: () async {
                          cubit.submitOTP();
                          // PhoneAuthCredential credential= PhoneAuthProvider.credential(verificationId: widget.verificationId!, smsCode:otpController.toString() );
                          // await FirebaseAuth.instance.signInWithCredential(credential);
                          if(FirebaseAuth.instance.currentUser != null){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>  welcomeScreen()),
                                )
                            );
                          }
                        },
                        text: 'verify and create account',
                        context: context),
                  ]),
            ),
          );
        });
  }
}
