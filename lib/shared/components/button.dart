
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
Widget button({
  required String text,
  required VoidCallback onpress,
  required double width,
  required double height,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: colortheme.lightPurple,
        borderRadius: BorderRadius.circular(height * 0.4),
        boxShadow: [
          BoxShadow(
            color: colortheme.lightPurple.withOpacity(0.5),
            blurRadius: 12,
            offset: const Offset(0, 12),
          ),
          const BoxShadow(
            color: colortheme.lightPurple,
            offset: Offset(12, 0),
          ),
          const BoxShadow(
            color: colortheme.lightPurple,
            offset: Offset(-12, 0),
          ),
        ],
      ),
      child: MaterialButton(
        // ignore: curly_braces_in_flow_control_structures
        onPressed: onpress,
        // ignore: curly_braces_in_flow_control_structures
        child: Text(text,
            style: const TextStyle(
              fontSize: 20,
              color: colortheme.white,
            )),
      ),
    );
