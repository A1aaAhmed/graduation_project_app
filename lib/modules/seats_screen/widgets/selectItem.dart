import 'package:flutter/material.dart';

class SelectModel {
  final String text;
  final Color color;
  SelectModel({
    required this.text,
    required this.color,
  });
}

Widget selectItem(SelectModel selection) => Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: selection.color),
        ),
        Text(selection.text),
        const SizedBox(
          width: 10,
        ),
      ],
    );
