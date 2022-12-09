import 'package:flutter/material.dart';
import 'package:flutterproject/registerScreen.dart';

class loginSreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Text('Welcome Back!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  keyboardType:TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),

                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 52,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.indigo[500],
                  ),
                  child: MaterialButton(
                    onPressed: (){},
                    child: Text('SIGN IN',
                    style: TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.bold,
                     ),),
                    ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?',style: TextStyle(
                      color: Colors.grey[800],
                    ),),
                    SizedBox(
                      width:0,
                    ),
                    TextButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  registerScreen()),
                          );
                        },
                        child: Text('SIGNUP',style: TextStyle(
                          //color: Colors.indigo[700],
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
