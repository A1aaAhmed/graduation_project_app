import 'package:flutter/material.dart';

class SelectModel {
  final String text;
  final Color color;
  SelectModel({
    required this.text,
    required this.color,
  });
}

Widget selectItem(SelectModel selection, BuildContext context) => Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 3.2),
          width: 7,
          height: 7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: selection.color),
        ),
        Text(selection.text, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(
          width: 7,
        ),
      ],
    );
