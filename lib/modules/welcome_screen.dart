import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/login_screen.dart';
import 'package:graduation_project_app/modules/register_screen.dart';

class ApisScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:
            Container(

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://www.rcrwireless.com/wp-content/uploads/2016/09/52457987_l.jpg'),
                fit: BoxFit.cover,),
              ),
              //color: Colors.teal[300],
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(35,),
                          color: Colors.white.withOpacity(0.6),
                      ) ,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      padding: EdgeInsetsDirectional.all(20),

                      child: Column(
                        children:[
                          Text('Find Your best',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.black,
                            ),),
                          Text('Timing and tickets',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.black,
                            ),),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Booking your tickets online with your',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Colors.black,
                            ),),
                          Text('best searching preferences all over EGYPT',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Colors.black,
                            ),),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                        decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(5,),
                            color: Colors.blue[800]
                        ) ,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        width: double.infinity,
                        // color: Colors.blueAccent,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.facebook,
                              color: Colors.white,),
                            MaterialButton(
                              onPressed:(){},
                              child: Text('Continue with Facebook',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300
                                ),),
                            ),
                          ],
                        ),
                      ),
                          SizedBox(
                        height: 10,
                      ),
                          Container(
                        decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(5,),
                            color: Colors.red
                        ) ,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.g_mobiledata,

                              color: Colors.white,
                            ),
                            MaterialButton(
                              onPressed:(){},
                              child: Text('Continue with Google',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300
                                ),),
                            ),
                          ],
                        ),
                      ),
                          SizedBox(
                        height: 10,
                      ),
                          Container(
                        decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(5,),
                            color: Colors.indigo[400]
                        ) ,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.email,

                              color: Colors.white,
                            ),
                            MaterialButton(
                              onPressed:(){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  loginSreen()),
                                );
                              },
                              child: Text('log in with email',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300
                                ),),
                            ),
                          ],
                        ),
                      ),
                          SizedBox(
                        height: 10,
                      ),
                         Container(
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(5,),
                              color: Colors.grey.withOpacity(0.4),
                            ) ,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            width: double.infinity,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  onPressed:(){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => registerScreen()),
                                    );
                                  },
                                  child: Text('Sign up with email',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(overflow: TextOverflow.ellipsis,'___________________________________________'),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(  'By continuing you agree to our'
                              ),
                              TextButton(
                                  onPressed: (){},
                                  child: Text('T&Cs',style: TextStyle(
                                      color: Colors.purpleAccent[700]
                                  ),))
                            ],
                          ),
                          Text('we use your data to offer you a personalized'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('experience.'),
                              TextButton(
                                  onPressed: (){},
                                  child: Text('Find out more',style: TextStyle(
                                      color: Colors.purpleAccent[700]
                                  ),))
                            ],
                          ),
                      ],),

                    ),
                  ],
                ),
              ),
            ),

        ),
      ),
    );
  }
}