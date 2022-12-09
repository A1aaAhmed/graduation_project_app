import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defualtForm ({
  required TextEditingController controller,
  required TextInputType inputType,
  Function? onsubmit,
  required String validator,
  required String lable,
  required IconData prefix,
  IconData? postfix,
  bool hidden = false,
  Function? sufffun,
})=>TextFormField(
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
    prefixIcon:Icon( prefix,),
    suffixIcon: IconButton(
      onPressed: (){
        sufffun!();
      },

      icon: Icon(
        postfix,
      ),
    ),

  ),
);