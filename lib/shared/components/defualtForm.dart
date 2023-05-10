import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:flutter/material.dart';

Widget defualtForm({
  required TextEditingController controller,
  required TextInputType inputType,
  Function? onsubmit,
  required String validator,
  required String lable,
  required IconData prefix,
  IconData? postfix,
  bool hidden = false,
  Function? sufffun,
 required bool read ,
}) =>
    TextFormField(
      readOnly: read,
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
cursorColor: colortheme.lightPurple,
      decoration: InputDecoration(
        labelText: lable,
        labelStyle: const TextStyle(color: colortheme.lightPurple),
        //labelStyle: TextStyle(color: colortheme.lightPurple),
        border: const OutlineInputBorder(),
        focusColor: colortheme.lightPurple,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: colortheme.lightPurple,
          ),
        ),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            sufffun!();
          },
          icon: Icon(
            postfix,
          ),
        ),
      ),
    );
