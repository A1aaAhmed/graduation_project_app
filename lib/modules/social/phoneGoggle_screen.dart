import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/social/verifyPhone.dart';
import 'package:graduation_project_app/shared/components/components.dart';
import 'package:graduation_project_app/shared/components/phoneField.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:graduation_project_app/shared/variables.dart';
import 'package:graduation_project_app/modules/register_screen/cubit/cubit.dart';


class phoneScreen extends StatefulWidget {
  final String? name;
  final String? email;
  phoneScreen(this.name,this.email);
  @override
  State<phoneScreen> createState() => _phoneScreenState();
}
class _phoneScreenState extends State<phoneScreen> {
  @override
  Widget build(BuildContext context) {
    late var formKey = GlobalKey<FormState>();
      TextEditingController phoneController = TextEditingController();
    return  Scaffold(
            appBar: AppBar(
              backgroundColor: colortheme.lightGray,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: colortheme.lightPurple,
                ),
                onPressed: () {},
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'please enter your mobile number',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: colortheme.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          'your number will be stored or used as a contact method after the first time time you register ',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.grey,
                              ),
                        ),
                        const SizedBox(
                          height: 34,
                        ),
                        phoneField(
                            controller: phoneController
                        ),


                        const SizedBox(
                          height: 20,
                        ),
                        defultButton(
                            background: colortheme.lightPurple,
                            function: () async {
                              if (formKey.currentState!.validate()) {
                                if (!await registerCubit.searchNumber(number: phoneController.text)) {
                                // registerCubit.get(context).userRegister(
                                //   firstName: firstName.text,
                                //   secondName: lastName.text,
                                //   phone: phoneControllor.text,
                                //   email: emailSignUp.text,
                                //   pass: passSignUp.text);

                                int resend = 0;
                                await FirebaseAuth.instance
                                    .verifyPhoneNumber(
                                  phoneNumber:
                                  "+2${phoneController.text}",
                                  verificationCompleted:
                                      (phoneAuthCredential) {},
                                  verificationFailed: (error) {
                                  },
                                  codeSent: (String verificationId,
                                      int? forceResendingToken) async {
                                    realOpt = verificationId;
                                    resend = forceResendingToken!;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: ((context) => verifyPhoneScreen(phoneController.text,widget.name,widget.email,'0'))));
                                  },
                                  forceResendingToken: resend,
                                  codeAutoRetrievalTimeout:
                                      (String verificationId) {
                                    verificationId = realOpt;
                                  },
                                );
                              }else {
                                showToast(
                                  text:
                                  'This phone Number Is Already Exist',
                                  status: toastStates.WARNING,
                                );
                              }}
                            },

                            text: 'verify your phone number',
                            context: context)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
  }

