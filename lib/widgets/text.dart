import 'package:flutter/material.dart';

// ignore: camel_case_types
class text extends StatelessWidget {
  final String txt;
  final double size;
  final FontWeight weight;

  const text(
      {super.key, required this.txt, required this.size, required this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(txt,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: size,
              fontWeight: weight,
            ));
  }
}
