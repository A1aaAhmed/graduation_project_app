import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
Widget AutoSizedText ({
  required double h ,
  required double w ,
  required String text,
  required var fontSize,
  required var maxLines,
  required Color textColor ,
  AlignmentGeometry align=Alignment.center,
  double paddingSymHoriz=0,
  double paddingSymVert=0,
  double borderRad=0,
  double shadowCap=0,

})=> Sizer(
builder: (context, orientation, deviceType) {
 return Container(
    width: w,
    height: h,
    alignment: align,
    padding:  EdgeInsets.symmetric(horizontal:paddingSymHoriz ,vertical: paddingSymVert ),
    decoration: BoxDecoration(
     borderRadius: BorderRadius.circular(borderRad),
     color: Colors.grey.withOpacity(shadowCap),
   ),
    child: FittedBox(
      fit: BoxFit.contain,
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        style:  TextStyle(
          color: textColor,
          fontSize:fontSize*50,
          fontWeight: FontWeight.bold
        ),
      ),
    ),
  );}
);