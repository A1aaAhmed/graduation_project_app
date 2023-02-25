import 'package:flutter/material.dart';
import 'package:graduation_project_app/shared/style/colors.dart';

Widget formfield({
  required String label,
  String? hint ,
  required TextEditingController controller,
  required String msg,
}) =>
    TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return msg;
          }
          return null;
        },
        controller: controller,
        cursorColor: colortheme.lightPurple,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: colortheme.lightPurple),
          focusedBorder: const UnderlineInputBorder(),
          hintText: hint!=null ? hint : null,
        ));
