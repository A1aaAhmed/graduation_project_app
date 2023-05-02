import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/transition.dart';
import 'package:graduation_project_app/modules/social/cubit/cubit.dart';
import 'package:graduation_project_app/modules/social/cubit/states.dart';
import 'package:graduation_project_app/modules/social/phoneGoggle_screen.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:graduation_project_app/modules/login_screen/login_screen.dart';
import 'package:graduation_project_app/modules/register_screen/register_screen.dart';
import 'package:graduation_project_app/network/local/shared_pref.dart';
import 'package:graduation_project_app/shared/variables.dart';

import '../../shared/components/components.dart';
class welcomeScreen extends StatefulWidget {
  const welcomeScreen({Key? key}) : super(key: key);

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => googleCubit(),
      child: BlocConsumer<googleCubit,googleStates>(
        listener: (context,state){

        },
        builder: (context,state){
          return  Scaffold(
            body: SafeArea(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/train.jpg'),
                    fit: BoxFit.cover,
                  ),),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Container(
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(35,),
                          color: Colors.white.withOpacity(0.6),
                        ) ,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Find Your best',style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: colortheme.black,
                                  fontWeight: FontWeight.bold
                              ),
                              ),

                              const SizedBox(height: 5,),
                              Text('Timing and tickets',
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: colortheme.black,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              const SizedBox(height: 15,),
                              Text('Booking your tickets online with your',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: colortheme.black,
                                    fontSize: 12
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Text('best searching preferences all over EGYPT',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: colortheme.black,
                                    fontSize: 12
                                ),
                              ),
                              const SizedBox(height: 15,),

                              iconTextButton(
                                  context: context,
                                  background: Colors.red,
                                  iconp: Icons.g_mobiledata,
                                  text: "Contine with Google",
                                  function: ()async{
                                    User?user;
                                    user=await googleCubit.get(context).signInWithGoogle();
                                    if(user != null){
                                      String phoneSnapshot=await checkNumberExist(user.email!);
                                      if (phoneSnapshot!=""){
                                        casheHelper.saveData(key: 'uId', value: phoneSnapshot).then((value) {
                                           uId=casheHelper.getData(key: 'uId');
                                           Navigator.push(
                                          context, MaterialPageRoute(builder: ((context) => Trans())));            });
                                      }
                                      else{
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: ((context) =>  phoneScreen(user?.displayName,user?.email))
                                          )
                                      );
                                    }}
                                  }),

                              const SizedBox(height: 15,),
                              iconTextButton(
                                context: context,
                                background: Colors.indigo.shade400,
                                iconp: Icons.email,
                                text: "Log in with Email",
                                function: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  loginSreen()),);
                                },),
                              const SizedBox(height: 15,),
                              defultButton(
                                  context: context,
                                  background: Colors.grey,
                                  function: (){
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>registerScreen()),
                                    );
                                  },
                                  text: "Sign up with Email"),
                              const SizedBox(height: 15,),
                              // Container(
                              //  width: double.infinity,
                              // height: 1,
                              // color: Colors.grey,
                              // ),
                              const SizedBox(height: 15,),

                            ],
                          ),
                        ),
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

