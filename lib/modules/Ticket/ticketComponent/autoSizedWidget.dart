// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

Widget AutoSizedWidget({
  required Widget item,
  AlignmentGeometry align = Alignment.center,
  double paddingSymHoriz = 0,
  double paddingSymVert = 0,
  double borderRad = 0,
  bool top=false
}) =>
    Container(
      alignment: top?Alignment.topCenter:align,
      padding: EdgeInsets.symmetric(
          horizontal: paddingSymHoriz, vertical: paddingSymVert),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: item,
      ),
    );
