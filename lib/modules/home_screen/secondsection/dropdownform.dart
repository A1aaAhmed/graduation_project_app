import 'package:flutter/material.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:graduation_project_app/shared/variables.dart';

Widget dropdownform(countries, String msg, Text label) {
  var selectedvalue;
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: DropdownButtonFormField(
        items: countries,
        hint: label,
        value: selectedvalue,
        validator: (value) => value == null ? msg : null,
        onChanged: (value) {
          selectedvalue = value;
          if (msg == "Enter your location, Please") {
            from = value;
          } else if (msg == "Enter your destination, Please") {
            to = value;
          } else {
            depart = value;
          }
        },
        focusColor: colortheme.lightPurple,
        style: const TextStyle(color: colortheme.lightPurple),
        isDense: false,
        decoration: const InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
          color: colortheme.lightPurple,
        )))),
  );
}
