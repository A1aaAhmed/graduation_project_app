
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
Widget AutoSizedWidget({

  required Widget item,
  AlignmentGeometry align=Alignment.center,
  double paddingSymHoriz=0,
  double paddingSymVert=0,
  double borderRad=0,

})=> Sizer(
    builder: (context, orientation, deviceType) {
      return Container(

        alignment: align,
        padding:  EdgeInsets.symmetric(horizontal:paddingSymHoriz ,vertical: paddingSymVert ),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: FittedBox(
          fit: BoxFit.contain,
          child: item,
        ),
      );}
);