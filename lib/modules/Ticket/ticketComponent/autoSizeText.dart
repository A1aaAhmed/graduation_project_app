import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
Widget AutoSizedText ({
  required double w,
  required String text,
  required var fontSize,
  required var maxLines,
  required Color textColor ,
 TextAlign align=TextAlign.center,
  double paddingSymHoriz=0,
  double paddingSymVert=0,
  double borderRad=0,
  double shadowCap=0,
  bool h=false,

})=> Sizer(
builder: (context, orientation, deviceType) {
 return Container(
   width: w,
   padding: EdgeInsets.symmetric(vertical: paddingSymVert,horizontal: paddingSymHoriz),
   color:Colors.grey.withOpacity(shadowCap) ,
   child: FittedBox(
     fit: BoxFit.scaleDown,
     alignment: h?Alignment.center:Alignment.centerLeft,
     child: Text(
       text,
       overflow: TextOverflow.ellipsis,
       textAlign: align,
       maxLines: maxLines,
       style:  TextStyle(
         color: textColor,
         fontSize:fontSize,
         fontWeight: FontWeight.bold,


       ),
     ),
   ),
 );}
);