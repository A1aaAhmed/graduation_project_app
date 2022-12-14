import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
Widget AutoSizedColumn ({
  required double h,
  double h2=0,
  double h3=0,
  double hInti=0,
  required Widget item1,
  required Widget item2,
  Widget item3=const SizedBox(),
  Widget item4=const SizedBox(),
  bool alignCenter=false,
  bool alignCenterMain=false,
})=> Sizer(
    builder: (context, orientation, deviceType) {
      return Column(
        mainAxisAlignment:  alignCenterMain?MainAxisAlignment.center:MainAxisAlignment.start,
        crossAxisAlignment: alignCenter?CrossAxisAlignment.center:CrossAxisAlignment.start,
        children: [
          SizedBox(height:hInti,),
          item1,
          SizedBox(height:h,),
          item2,
          SizedBox(height: h2,),
          item3,
          SizedBox( height: h3,),
          item4,
        ],
      );
    }
);