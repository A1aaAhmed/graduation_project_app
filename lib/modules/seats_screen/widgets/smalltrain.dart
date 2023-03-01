import 'package:flutter/material.dart';
import 'package:graduation_project_app/shared/style/colors.dart';

Widget smallTrain() => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              width: 40,
              height: 80,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22),
                      bottomLeft: Radius.circular(4.5),
                      bottomRight: Radius.circular(4.5))),
            ),
            Container(
              margin: const EdgeInsets.only(top: 7),
              width: 30,
              height: 20,
              decoration: const BoxDecoration(
                  color: colortheme.blueGray,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22))),
            ),
          ],
        ),
        Container(
          width: 40,
          height: 60,
          margin: const EdgeInsets.only(top: 7),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(4.5)),
        ),
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              width: 40,
              height: 80,
              margin: const EdgeInsets.symmetric(vertical: 7),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.5),
                      topRight: Radius.circular(4.5),
                      bottomLeft: Radius.circular(22),
                      bottomRight: Radius.circular(22))),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              width: 30,
              height: 20,
              decoration: const BoxDecoration(
                  color: colortheme.blueGray,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(22),
                      bottomRight: Radius.circular(22))),
            ),
          ],
        ),
      ],
    );
