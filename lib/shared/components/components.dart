import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/shared/style/colors.dart';

import '../variables.dart';

Widget iconTextButton(
        {required Color background,
        required IconData iconp,
        required String text,
        required BuildContext context,
        required VoidCallback function}) =>
    Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: TextButton.icon(
        onPressed: function,
        icon: Icon(
          iconp,
          color: Colors.white,
          size: 30,
        ),
        label: Text(
          '$text',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colortheme.white,
              ),
        ),
      ),
    );

Widget defultButton({
  required Color background,
  required VoidCallback function,
  required String text,
  required BuildContext context,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          5,
        ),
        color: background,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: double.infinity,
      height: 50,
      child: MaterialButton(
          onPressed: function,
          child: Text(
            '$text',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colortheme.white,
                ),
          )),
    );

Widget textButon({
  required BuildContext context,
  required String text,
  required VoidCallback function,
}) =>
    TextButton(
        onPressed: function,
        child: Text(
          '$text',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colortheme.lightPurple, fontWeight: FontWeight.bold),
        ));

Widget defualtForm({
  required TextEditingController controller,
  required TextInputType inputType,
  Function? onsubmit,
  required String validator,
  required String lable,
  IconData? prefix,
  IconData? postfix,
  bool hidden = false,
  Function()? sufffun,
  bool read = false,
}) =>
    TextFormField(
      readOnly: read,
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return validator;
        } else {
          return null;
        }
      },
      controller: controller,
      keyboardType: inputType,
      obscureText: hidden,
      onFieldSubmitted: (s) {
        print('=========');
        print(s);
        print('=========');
        print(controller.text);
        if (lable == 'enter your name') {
          nameController.text = s;
        } else if (lable == 'enter your email') {
          emailController.text = s;
        }

        print('=========');
        print(nameController.text);

        // onsubmit!(s);
      },
      //function that i can do work on it

// ignore: prefer_const_constructors
      cursorColor: colortheme.lightPurple,
      decoration: InputDecoration(
        labelText: lable,
        labelStyle: const TextStyle(color: colortheme.lightPurple),
        //labelStyle: TextStyle(color: colortheme.lightPurple),
        border: const OutlineInputBorder(),
        focusColor: colortheme.lightPurple,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: colortheme.lightPurple,
          ),
        ),
        prefixIcon: Icon(
          prefix,
          color: colortheme.lightPurple,
        ),
        suffixIcon: IconButton(
          onPressed: postfix != null ? sufffun : () {},
          icon: Icon(
            postfix,
            color: colortheme.lightPurple,
          ),
        ),
      ),
    );
void showToast({required String text, required toastStates status}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: choseToastColor(status),
        textColor: Colors.white,
        fontSize: 16.0);

enum toastStates { SUCESS, ERROR, WARNING }

Color choseToastColor(toastStates? state) {
  Color color = Colors.white;
  switch (state) {
    case toastStates.SUCESS:
      color = Colors.green;
      break;
    case toastStates.ERROR:
      color = Colors.red;
      break;
    case toastStates.WARNING:
      color = Colors.yellow;
      break;
  }
  return color;
}
