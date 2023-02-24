import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/login_screen/login_screen.dart';
import 'package:graduation_project_app/modules/register_screen/register_screen.dart';
import '../shared/components/components.dart';
class welcomeScreen extends StatelessWidget {
  const welcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
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
                            background: Colors.blue.shade800,
                            iconp: Icons.facebook,
                            text: "Continue with Facebook",
                            function: (){}),
                        const SizedBox(height: 15,),
                        iconTextButton(
                            background: Colors.red,
                            iconp: Icons.g_mobiledata,
                            text: "Contine with Google",
                            function: (){}),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(  'By continuing you agree to our'
                            ),
                            textButon(text: 'T&Cs', function: (){})
                          ],
                        ),
                        const Text('we use your data to offer you a personalized'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('experience.'),
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
