import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/login_screen/login_screen.dart';
import 'package:graduation_project_app/modules/register_screen/register_screen.dart';
import '../shared/components/components.dart';
class welcomeScreen extends StatelessWidget {
  const welcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
        body: SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              repeat: ImageRepeat.noRepeat,
              image: AssetImage('images/train.jpg'),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  35,
                ),
                color: Colors.white.withOpacity(0.7),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              padding: const EdgeInsetsDirectional.all(20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Find Your best',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Timing and tickets',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Booking your tickets online with your',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'best searching preferences all over EGYPT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                  ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                  color: Colors.blue[800]),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: double.infinity,
              // color: Colors.blueAccent,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.facebook,
                    color: Colors.white,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      'Continue with Facebook',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                  color: Colors.red),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: double.infinity,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.g_mobiledata,
                    color: Colors.white,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      'Continue with Google',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                  color: Colors.indigo[400]),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: double.infinity,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => loginSreen()),
                      );
                    },
                    child: const Text(
                      'log in with email',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
      ),
    ));
=======
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
                            function: (){}),
                        SizedBox(height: 15,),
                        iconTextButton(
                            background: Colors.red,
                            iconp: Icons.g_mobiledata,
                            text: "Contine with Google",
                            function: (){}),
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
>>>>>>> 960b1e8d37f8af9e7e5f33be63d1d12aeee3a53e
  }
}
