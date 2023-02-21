import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget iconTextButton(
    {required Color background,
      required IconData iconp,
      required String text,
      required VoidCallback function}) =>
    Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: TextButton.icon(
        onPressed: function,
        icon: Icon(iconp,color: Colors.white,),
        label: Text(
          '$text',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );

Widget defultButton({
  required Color background,
  required VoidCallback function,
  required String text,
}) => Container(
  decoration:BoxDecoration(
    borderRadius: BorderRadius.circular(5,),
    color: background,
  ) ,
  clipBehavior: Clip.antiAliasWithSaveLayer,
  width: double.infinity,
  height: 50,
  child: MaterialButton(
    onPressed: function,
    child: Text('$text',style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w300,
    ),),
  ),
);

Widget textButon({
  required String text,
  required VoidCallback function,
}) =>TextButton(
    onPressed: function,
    child: Text('$text',style: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 15,
      color: Colors.purple.shade700,
    ),));

Widget defualtForm({
  required TextEditingController controller,
  required TextInputType inputType,
  Function? onsubmit,
  required String validator,
  required String lable,
  IconData? prefix,
  IconData? postfix,
  bool hidden = false,
  Function? sufffun,
}) =>
    TextFormField(
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return validator;
        }

        return null;
      },
      controller: controller,
      keyboardType: inputType,
      obscureText: hidden,
      onFieldSubmitted: (s) {
        onsubmit!(s);
      },
      //function that i can do work on it

// ignore: prefer_const_constructors
      decoration: InputDecoration(
        //hintText: 'abc@examble.com',
        labelText: lable,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            sufffun!(
            );
          },
          icon: Icon(
            postfix,
          ),
        ),
      ),
    );
void showToast({
          required String text,
          required toastStates status
               }) =>  Fluttertoast.showToast(
                     msg: text,
                     toastLength: Toast.LENGTH_SHORT,
                     gravity: ToastGravity.BOTTOM,
                     timeInSecForIosWeb: 5,
                     backgroundColor: choseToastColor(status),
                     textColor: Colors.white,
                     fontSize: 16.0
);
enum toastStates {SUCESS,ERROR,WARNING}
Color choseToastColor(toastStates? state){
    Color color=Colors.white;
  switch(state){
    case toastStates.SUCESS:
     color =Colors.green;
     break;
    case toastStates.ERROR :
    color =Colors.red;
    break;
    case toastStates.WARNING:
    color =Colors.yellow;
    break;
  }
  return  color;
}