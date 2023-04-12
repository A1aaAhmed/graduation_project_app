import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/social/verifyPhone.dart';
import 'package:graduation_project_app/modules/social/welcome_screen.dart';
import 'package:graduation_project_app/shared/components/components.dart';
import 'package:graduation_project_app/shared/components/phoneField.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class phoneScreen extends StatefulWidget {
  const phoneScreen({Key? key}) : super(key: key);

  @override
  State<phoneScreen> createState() => _phoneScreenState();
}

class _phoneScreenState extends State<phoneScreen> {
  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    late var formKey=GlobalKey<FormState>();
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: colortheme.lightGray,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: colortheme.lightPurple,),onPressed: (){},),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text('please enter your mobile number',style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: colortheme.black,
                    fontWeight: FontWeight.bold
                ),
                ),
                SizedBox(height: 6,),
                Text('your number will be stored or used as a contact method after the first time time you register '
                  ,style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey,
                  ),),
                SizedBox(height: 34,),
                phoneField(controller: phoneController),
                SizedBox(height: 20,),
                defultButton(background: colortheme.lightPurple,
                    function: ()async{
                      if(formKey.currentState!.validate()){

                        await  FirebaseAuth.instance.verifyPhoneNumber(
                          verificationCompleted: (PhoneAuthCredential credential){
                           setState(() {
                             print('sucess');
                             print(credential);
                           });
                          },
                          verificationFailed: (error){
                            setState(() {
                              print(error.toString());
                            });
                          },
                          timeout: const Duration(seconds:10),
                          codeSent: ( verificationId , forceResendingToken)async{
                           await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>  verifyPhoneScreen(verificationId:verificationId  ,))
                                )
                            );
                          },
                          codeAutoRetrievalTimeout: (verificationId){},
                        );
                      }
                    },
                    text: 'verify your phone number',
                    context: context)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
