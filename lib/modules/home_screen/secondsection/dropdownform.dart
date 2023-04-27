import 'package:flutter/material.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:graduation_project_app/shared/variables.dart';

Widget dropdownform(list, String msg, String label, context) {
  var selectedvalue;
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: DropdownButtonFormField(
        items: list,
        value: selectedvalue,
        validator: (value) => value == null ? msg : null,
        onChanged: (value) {
          selectedvalue = value;
          if (msg == "Enter your location, Please") {
            from = value.toString();
          } else if (msg == "Enter your destination, Please") {
            to = value.toString();
          } else {
            depart = value.toString();
          }
        },
        focusColor: colortheme.lightPurple,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colortheme.lightPurple,
            ),
        isDense: false,
        decoration: InputDecoration(
          hintText: label,
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colortheme.lightPurple,
                ),
            focusedBorder:const UnderlineInputBorder(
                borderSide: BorderSide(
              color: colortheme.lightPurple,
            ))
        )),
  );
}
