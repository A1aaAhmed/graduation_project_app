// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget AutoSizedRow({
  required double h,
  double h2 = 0,
  double h3 = 0,
  double hInit = 0,
  required Widget item1,
  required Widget item2,
  Widget item3 = const SizedBox(),
  Widget item4 = const SizedBox(),
  bool centerAlign = false,
  bool centerAlignMain = false,
}) =>
    Row(
      crossAxisAlignment:
          centerAlign ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: centerAlignMain
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: [
        SizedBox(
          width: hInit,
        ),
        item1,
        SizedBox(
          width: h,
        ),
        item2,
        SizedBox(
          width: h2,
        ),
        item3,
        SizedBox(
          width: h3,
        ),
        item4,
      ]
    );
