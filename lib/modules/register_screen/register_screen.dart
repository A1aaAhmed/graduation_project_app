import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/login_screen/login_screen.dart';
import 'package:graduation_project_app/modules/register_screen/cubit/cubit.dart';
import 'package:graduation_project_app/modules/register_screen/cubit/states.dart';
import 'package:graduation_project_app/modules/social/verifyPhone.dart';
import 'package:graduation_project_app/shared/components/phoneField.dart';
import 'package:graduation_project_app/shared/variables.dart';
import '../../shared/components/components.dart';
import 'package:graduation_project_app/shared/style/colors.dart';

class registerScreen extends StatelessWidget {
  var firstName = TextEditingController();
  var phoneControllor = TextEditingController();
  var lastName = TextEditingController();
  var emailSignUp = TextEditingController();
  var passSignUp = TextEditingController();
  var confirmPass = TextEditingController();
  late var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => registerCubit(),
      child: BlocConsumer<registerCubit, registerStates>(
        listener: (context, state) {
          // if (state is createUserErrorState) {
          //   showToast(text: state.error.toString(), status: toastStates.ERROR);
          // }
          // if (state is createUserSucessState) {
          //   showToast(
          //       text: 'an code will sent to your phone',
          //       status: toastStates.SUCESS);
          //   casheHelper.saveData(key: 'uId', value: state.uId).then((value) {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: ((context) =>
          //                 verificationRegisterScreen(phoneControllor.text))));
          //   });
          // }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Register',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: colortheme.lightPurple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 29),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defualtForm(
                          read: false,
                          controller: firstName,
                          inputType: TextInputType.text,
                          validator: 'required',
                          lable: 'First Name',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defualtForm(
                            read: false,
                            controller: lastName,
                            inputType: TextInputType.text,
                            validator: 'required',
                            lable: 'Last Name'),
                        const SizedBox(
                          height: 20,
                        ),
                        phoneField(controller: phoneControllor),
                        const SizedBox(
                          height: 20,
                        ),
                        defualtForm(
                          read: false,
                          controller: emailSignUp,
                          inputType: TextInputType.emailAddress,
                          validator: 'required',
                          lable: 'Email Address',
                          prefix: Icons.email,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defualtForm(
                          read: false,
                          controller: passSignUp,
                          inputType: TextInputType.visiblePassword,
                          validator: 'required',
                          lable: 'Password',
                          prefix: Icons.lock,
                          hidden: registerCubit.get(context).isPass,
                          postfix: registerCubit.get(context).isPass
                              ? Icons.visibility_off
                              : Icons.visibility,
                          sufffun: () {
                            registerCubit.get(context).passtrue();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: confirmPass,
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'required';
                            }
                            if (confirmPass.text != passSignUp.text) {
                              return 'not match';
                            }
                            if (value.length < 6) {
                              return 'password must be strong and greater than 6';
                            }
                            return null;
                          },
                          cursorColor: colortheme.lightPurple,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: registerCubit.get(context).conPass,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            // labelStyle: TextStyle(color: colortheme.lightPurple),
                            border: const OutlineInputBorder(),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: colortheme.lightPurple,
                              ),
                            ),
                            focusColor: colortheme.lightPurple,
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: colortheme.lightPurple,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                registerCubit.get(context).passContrue();
                              },
                              icon: Icon(
                                registerCubit.get(context).conPass
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: colortheme.lightPurple,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(
                            condition: state is! registerLoadinglState,
                            builder: (context) => defultButton(
                                  context: context,
                                  background: colortheme.lightPurple,
                                  function: () async {
                                    if (formKey.currentState!.validate()) {
                                      if (!await registerCubit.searchNumber(
                                          number: phoneControllor.text)) {
                                        // registerCubit.get(context).userRegister(
                                        //   firstName: firstName.text,
                                        //   secondName: lastName.text,
                                        //   phone: phoneControllor.text,
                                        //   email: emailSignUp.text,
                                        //   pass: passSignUp.text);
                                        registerCubit.get(context).emit(registerLoadinglState());
                                        int resend = 0;
                                        await FirebaseAuth.instance
                                            .verifyPhoneNumber(
                                          phoneNumber:
                                              "+2${phoneControllor.text}",
                                          verificationCompleted:
                                              (phoneAuthCredential) {},
                                          verificationFailed: (error) {
                                            registerCubit.get(context).emit(registerErrorState(error.toString()));
                                            showToast(
                                              text:
                                              'we run into a problem check your connection and try again later ',
                                              status: toastStates.WARNING,
                                            );

                                          },
                                          codeSent: (String verificationId,
                                              int? forceResendingToken) async {
                                            realOpt = verificationId;
                                            resend = forceResendingToken!;
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: ((context) =>
                                                      verifyPhoneScreen(
                                                        phoneControllor.text,
                                                        '${firstName.text} ${lastName.text}',
                                                        emailSignUp.text,
                                                        passSignUp.text,
                                                      )),
                                                ));
                                          },
                                          forceResendingToken: resend,
                                          codeAutoRetrievalTimeout:
                                              (String verificationId) {
                                            verificationId = realOpt;
                                          },
                                        );
                                      } else {
                                        showToast(
                                          text:
                                              'This phone Number Is Already Exist',
                                          status: toastStates.WARNING,
                                        );
                                      }
                                    }
                                  },
                                  text: "Next",
                                ),
                            fallback: (context) =>
                                const CircularProgressIndicator(
                                  color:colortheme.lightPurple,
                                )),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: colortheme.black,
                                  ),
                            ),
                            textButon(
                                context: context,
                                text: 'SIGNIN',
                                function: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => loginSreen()),
                                  );
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
