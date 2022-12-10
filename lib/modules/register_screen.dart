import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/login_screen.dart';
class registerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child:
              Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text('Register',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  )
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'First name',
                      border: OutlineInputBorder()
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: 'Last name',
                        border: OutlineInputBorder()
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                        labelText: 'Email Adress',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(child: TextButton(onPressed: (){},
                        child: const Icon(Icons.check_circle_rounded,color: Colors.indigo,),
                      ),),
                      Expanded(child: Text('I agree with',style: TextStyle(
                        color: Colors.grey[800],
                      ),),),
                      Expanded(child: TextButton(onPressed: (){},
                          child: const Text('Terms and Conditions & Privacy',style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),)),),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.indigo[500],
                    ),
                    child: MaterialButton(
                      onPressed: (){},
                      child: const Text('SUMBIT',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?',style: TextStyle(
                        color: Colors.grey[800],
                      ),),
                      TextButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  loginSreen()),
                            );
                          },
                          child: const Text('LOGIN',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),)
                    ],
                  )

                ],
              ),

          ),
        ),
      ),
    );
  }
}
