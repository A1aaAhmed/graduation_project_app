import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation_project_app/layout/transition.dart';
import 'package:graduation_project_app/modules/login_screen/login_screen.dart';
import 'package:graduation_project_app/modules/register_screen/register_screen.dart';
import '../../shared/components/components.dart';

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({ super.key });

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        const Text('Find Your best',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5,),
                        const Text('Timing and tickets',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            color: Colors.black,
                          ),),
                        const SizedBox(height: 15,),
                        const Text('Booking your tickets online with your',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: Colors.black,
                          ),),
                        const SizedBox(height: 5,),
                        const Text('best searching preferences all over EGYPT',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: Colors.black,
                          ),),
                        const SizedBox(height: 15,),
                        iconTextButton(
                            background: Colors.red,
                            iconp: Icons.g_mobiledata,
                            text: "Contine with Google",
                            function: ()async{
                              UserCredential crd = await signInWithGoogle();
                              if(crd.user!= null)
                            {
                               Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  const Trans()),);}
                            }),
                        const SizedBox(height: 15,),
                        iconTextButton(
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
                            background: Colors.grey,
                            function: (){
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>registerScreen()),
                              );
                            },
                            text: "Sign up with Email"),
                        const SizedBox(height: 15,),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 15,),
                        Column(

                          children: [
                            const Text(  'By continuing you agree to our     ',textAlign: TextAlign.start,
                            ),
                            textButon(text: 'T&Cs',
                                function: (){}),

                          ],
                        ),

                       // Text('we use your data to offer you a personalized experience.'),
                        Column(

                          children: [
                            const Text('we use your data to offer you a personalized experience.',),
                            textButon(text: 'Find out more', function: (){})
                          ],
                        ),
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
  }
}
