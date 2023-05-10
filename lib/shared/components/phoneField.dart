import 'package:flutter/cupertino.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:flutter/material.dart';
Widget phoneField({
  required TextEditingController controller
})=>TextFormField(
  controller:controller ,
  validator: (String ?value)  {
    if(value == null || value.trim().isEmpty){
      return 'required';
    }
    if(value.length != 11 ){

      return 'number must be 11 digits';
    }
    if(!(value.startsWith('011')||value.startsWith('010' )||value.startsWith('012' )||value.startsWith('015' )))
    {
        return 'number must start with 010 or 011 or 012 or 015';
}

  },
        cursorColor: colortheme.lightPurple,
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        labelStyle:  TextStyle(color: colortheme.lightPurple),
        //labelStyle: TextStyle(color: colortheme.lightPurple),
        border:  OutlineInputBorder(),
        focusColor: colortheme.lightPurple,
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(
            color: colortheme.lightPurple,
          ),
        ),
    prefixIcon: Icon(Icons.phone_android,color: colortheme.lightPurple,),

  ),
);
