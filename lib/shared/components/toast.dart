import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 20,
        gravity: ToastGravity.BOTTOM);

enum ToastStates { correct, error }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.correct:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
  }
  return color;
}
