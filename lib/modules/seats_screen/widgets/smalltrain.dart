import 'package:flutter/material.dart';
import 'package:graduation_project_app/shared/style/colors.dart';

Widget smallTrain({required double width, required double height}) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              width: width * 0.1,
              height: height * 0.1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(width * 0.06),
                      topRight: Radius.circular(width * 0.06),
                      bottomLeft: Radius.circular(width * 0.012),
                      bottomRight: Radius.circular(width * 0.012))),
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.007),
              width: width * 0.082,
              height: height * 0.026,
              decoration: BoxDecoration(
                  color: colortheme.blueGray,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(width * 0.04),
                      topRight: Radius.circular(width * 0.04))),
            ),
          ],
        ),
        Container(
          width: width * 0.1,
          height: height * 0.08,
          margin: EdgeInsets.only(top: height * 0.009),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(width * 0.012)),
        ),
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              width: width * 0.1,
              height: height * 0.1,
              margin: EdgeInsets.symmetric(vertical: height * 0.009),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(width * 0.012),
                      topRight: Radius.circular(width * 0.012),
                      bottomLeft: Radius.circular(width * 0.06),
                      bottomRight: Radius.circular(width * 0.06))),
            ),
            Container(
              margin: EdgeInsets.only(bottom: height * 0.015),
              width: width * 0.082,
              height: height * 0.026,
              decoration: BoxDecoration(
                  color: colortheme.blueGray,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(width * 0.04),
                      bottomRight: Radius.circular(width * 0.04))),
            ),
          ],
        ),
      ],
    );
