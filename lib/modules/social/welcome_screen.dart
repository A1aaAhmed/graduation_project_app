import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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
  //Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
   // final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    //final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    //return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/train.jpg'),
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
                        Text('Find Your best',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text('Timing and tickets',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            color: Colors.black,
                          ),),
                        SizedBox(height: 15,),
                        Text('Booking your tickets online with your',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: Colors.black,
                          ),),
                        SizedBox(height: 5,),
                        Text('best searching preferences all over EGYPT',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: Colors.black,
                          ),),
                        SizedBox(height: 15,),
                        iconTextButton(
                            background: Colors.blue.shade800,
                            iconp: Icons.facebook,
                            text: "Continue with Facebook",
                            function: (){
                       //  UserCredential use   = await signInWithFacebook();
                         //if(use.user !=null){
                          // Navigator.push(
                           //  context,
                            // MaterialPageRoute(builder: (context) =>  Trans()),);
                        // }
                            }),
                        SizedBox(height: 15,),
                        iconTextButton(
                            background: Colors.red,
                            iconp: Icons.g_mobiledata,
                            text: "Contine with Google",
                            function: ()async{
                              //UserCredential crd = await signInWithGoogle();
                             // if(crd.user!= null)
                             //{
                              // Navigator.push(
                               // context,
                               // MaterialPageRoute(builder: (context) =>  Trans()),);}
                            }),
                        SizedBox(height: 15,),
                        iconTextButton(
                          background: Colors.indigo.shade400,
                          iconp: Icons.email,
                          text: "Log in with Email",
                          function: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  loginSreen()),);
                          },),
                        SizedBox(height: 15,),
                        defultButton(
                            background: Colors.grey,
                            function: (){
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>registerScreen()),
                              );
                            },
                            text: "Sign up with Email"),
                        SizedBox(height: 15,),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(  'By continuing you agree to our'
                            ),
                            textButon(text: 'T&Cs', function: (){})
                          ],
                        ),
                        Text('we use your data to offer you a personalized'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('experience.'),
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
