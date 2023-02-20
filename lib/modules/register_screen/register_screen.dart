import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/transition.dart';
import 'package:graduation_project_app/modules/login_screen/cubit/cubit.dart';
import 'package:graduation_project_app/modules/login_screen/login_screen.dart';
import 'package:graduation_project_app/modules/register_screen/cubit/cubit.dart';
import 'package:graduation_project_app/modules/register_screen/cubit/states.dart';
import '../../shared/components/components.dart';

class registerScreen extends StatelessWidget {
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var emailSignUp = TextEditingController();
  var passSignUp = TextEditingController();
  var confirmPass = TextEditingController();
  late var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => registerCubit(),
      child: BlocConsumer<registerCubit,registerStates>(
        listener: (context,state){
          if(state is registerErrorState){
            showToast(text:state.error.toString(),status:toastStates.ERROR);
          }
          if(state is registerSucessState){
            showToast(text:'you have sucessfully signed up',status:toastStates.SUCESS);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const Trans())
                )
            );
          }
        },
        builder: (context,state){
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child:
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text('Register',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            )
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defualtForm(
                          controller: firstName,
                          inputType: TextInputType.text,
                          validator: 'required',
                          lable: 'First Name',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defualtForm(
                            controller: lastName,
                            inputType: TextInputType.text,
                            validator: 'required',
                            lable: 'Last Name'),
                        SizedBox(
                          height: 20,
                        ),
                        defualtForm(
                            controller: emailSignUp,
                            inputType: TextInputType.emailAddress,
                            validator: 'required',
                            lable: 'Email Address',
                            prefix: Icons.email),
                        SizedBox(
                          height: 20,
                        ),
                        defualtForm(
                          controller: passSignUp,
                          inputType: TextInputType.visiblePassword,
                          validator:'required',
                          lable: 'Password',
                          prefix: Icons.lock,
                          hidden: registerCubit.get(context).isPass,
                          postfix: registerCubit.get(context).isPass? Icons.visibility_off:Icons.visibility,
                          sufffun: (){
                            registerCubit.get(context).passtrue();
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: confirmPass,
                          validator: (String?value){
                            if(value == null || value.trim().isEmpty){
                              return 'required';
                            }
                            if(confirmPass.text != passSignUp.text){
                              return 'not match';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: registerCubit.get(context).conPass,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            border: const OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: (){
                                registerCubit.get(context).passContrue();
                              },
                              icon: Icon(registerCubit.get(context).conPass?Icons.visibility_off:Icons.visibility),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(condition: state is! registerLoadinglState,
                            builder: (context)=>defultButton(
                                background: Colors.indigo.shade500,
                                function: (){
                                  if(formKey.currentState!.validate()){
                                    registerCubit.get(context).userRegister(
                                        firstName: firstName.text,
                                        secondName: lastName.text,
                                        email: emailSignUp.text,
                                        pass: passSignUp.text);
                                  }
                                },
                                text: "SUMBIT"),
                            fallback: (context)=>CircularProgressIndicator()),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account?',style: TextStyle(
                              color: Colors.grey[800],
                            ),),
                            textButon(
                                text: 'SIGNIN',
                                function: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  loginSreen()),
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