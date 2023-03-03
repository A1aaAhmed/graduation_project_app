import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/transition.dart';
import 'package:graduation_project_app/modules/Profile/profile_screen.dart';
import 'package:graduation_project_app/modules/home_screen/home_screen.dart';
import 'package:graduation_project_app/modules/register_screen/register_screen.dart';
import 'package:graduation_project_app/network/local/shared_pref.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:graduation_project_app/shared/variables.dart';
import '../../shared/components/components.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class loginSreen extends StatelessWidget {

  late var keyForm = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>loginCubit(),
      child: BlocConsumer<loginCubit, loginStates>(
            listener: (context, state)  {
              if(state is loginErrorState){
                  showToast(text:state.error,status:toastStates.ERROR);
              }
              if(state is loginSucessState){
                showToast(text:'you have sucessfuly loged in',status:toastStates.SUCESS);
                casheHelper.saveData(key:'uId', value: state.uId).then(
                        (value) {
                          print('new log in id is'+ state.uId);
                        //  uId=casheHelper.getData(key: 'uId');
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>  Trans())
                          )
                      );
                    });
                        }
            },
            builder: (context, state) {
              return Scaffold(
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Form(
                        key: keyForm,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                               Text('Welcome Back!',
                                textAlign: TextAlign.center,
                                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                     color: colortheme.lightPurple,
                                     fontWeight: FontWeight.bold,
                                     fontSize: 28
                                   ),
                               ),
                              const SizedBox(
                                height: 30,
                              ),
                              defualtForm(
                                  controller: emailController,
                                  inputType: TextInputType.emailAddress,
                                  validator: 'Email Address is requird',
                                  lable: 'Email Address',
                                  prefix: Icons.email),
                              const SizedBox(
                                height: 20,
                              ),
                              defualtForm(
                                controller: passController,
                                inputType: TextInputType.visiblePassword,
                                validator: 'Password is required',
                                lable: 'Password',
                                prefix: Icons.lock,
                                hidden: loginCubit
                                    .get(context)
                                    .isPass,
                                postfix: loginCubit
                                    .get(context)
                                    .isPass ? Icons.visibility_off : Icons
                                    .visibility,
                                sufffun: () {
                                  loginCubit.get(context).passtrue();
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ConditionalBuilder(
                                  condition: state is! loginLoadinglState,
                                  builder: (context) =>
                                      defultButton(
                                        context: context,
                                          background: colortheme.lightPurple,
                                          function: () {
                                            if (keyForm.currentState!.validate()) {
                                              loginCubit.get(context).userLogin(pass: passController.text, email: emailController.text);
                                            }
                                          },
                                          text: "SIGNIN"),
                                  fallback: (context) =>
                                      const CircularProgressIndicator()),

                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Don\'t have an account?',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: colortheme.black,
                              ),
                                  ),
                                  const SizedBox(
                                    width: 0,
                                  ),
                                  textButon(
                                    context: context,
                                    text: 'SIGNUP',
                                    function: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>
                                              registerScreen())
                                      );
                                    },),
                                ],
                              ),
                            ],
                          ),
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