
//لو الكود اشتغل هنلغي الصفحة ديه

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/register_screen/otpRegister.dart';
import 'package:graduation_project_app/modules/register_screen/register_screen.dart';
import 'package:graduation_project_app/shared/components/components.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:graduation_project_app/shared/variables.dart';
class verificationRegisterScreen extends StatelessWidget {
  final String? phoneNumber;
  verificationRegisterScreen(this.phoneNumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colortheme.lightGray,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: colortheme.lightPurple,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) =>  registerScreen()),
                )
            );
          },
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('we will send one time ',style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: colortheme.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 29
              ),),
              SizedBox(height: 10,),
              Text('code to ${phoneNumber}',style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: colortheme.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 29
              ),),
              SizedBox(height: 30,),
              defultButton(
                  text: 'Get OTP code',
                  background: colortheme.lightPurple,
                  function: ()async{
                    int resend=0;
                    print ("innnnnnn");
                    print(phoneNumber);
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber:"+2"+phoneNumber! ,
                      verificationCompleted: (phoneAuthCredential) {


                      },
                      verificationFailed:(error) {


                      },
                      codeSent: (String verificationId, int ?forceResendingToken)async {
                        print("                                    "+verificationId);
                        realOpt=verificationId;
                        resend=forceResendingToken!;
                        print ("yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy"+"       "+ realOpt);
                        //01553070083
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) =>  otpRegisterScreen(phoneNumber)),
                            )
                        );
                      },
                      forceResendingToken: resend,
                      codeAutoRetrievalTimeout: (String verificationId) {
                        verificationId = realOpt;
                      },
                    );
                  },
                  context: context
              ),
            ],
          ),
        ),
      ),
    );
  }
}
