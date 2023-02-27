import 'package:flutter/material.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
Future Alert ({
  required String checkText,
  required var context,
  required VoidCallback confirmFun,
})=> showDialog(
        context: context,
        builder: (context) =>
        AlertDialog(
                title: const Text(
                'Confirmation',
                style: TextStyle(fontSize: 23),
                ),
                content: Text(
                checkText,
                style: const TextStyle(fontSize: 20,color: Colors.red),
                textAlign: TextAlign.center,
                ),
                actions: [
                TextButton(
                onPressed:confirmFun,
                child: const Text(
                'Confirm',
                style: TextStyle(
                color: colortheme.lightPurple, fontSize: 17),
                )),
                TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                'Cancel',
                style: TextStyle(
                color: colortheme.lightPurple, fontSize: 17),
                ))
                ],
        ));