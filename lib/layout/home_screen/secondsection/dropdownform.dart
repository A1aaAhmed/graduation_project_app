import 'package:flutter/material.dart';
import 'package:graduation_project_app/shared/style/colors.dart';

Widget dropdownform(countries, String? selectedvalue, String msg, Text label) =>
    SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DropdownButtonFormField(
          items: countries,
          hint: label,
          value: selectedvalue,
          validator: (value) => value == null ? msg : null,
          onChanged: (value) {
            selectedvalue = value;
          },
          focusColor: colortheme.lightPurple,
          style: const TextStyle(color: colortheme.lightPurple),
          isDense: false,
          decoration: const InputDecoration(
              focusedBorder: UnderlineInputBorder( borderSide: BorderSide(
                color: colortheme.lightPurple,
              )))),
    );
