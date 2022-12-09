import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:graduation_project_app/shared/style/colors.dart';

class PlusorMinus extends StatefulWidget {
  final IconData icon;
  int travellers;
  PlusorMinus({
    super.key,
    required this.icon,
    required this.travellers,
  });

  @override
  State<PlusorMinus> createState() => _PlusorMinusState();
}

class _PlusorMinusState extends State<PlusorMinus> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.09,
      height: width * 0.09,
      decoration: BoxDecoration(
          color: colortheme.lightGray,
          borderRadius: BorderRadius.all(
            Radius.circular(width * .03),
          )),
      child: IconButton(
        onPressed: () {
          if (widget.icon == Icons.remove) {
            setState(() {
              if (widget.travellers == 0) {
                widget.travellers = 0;
              } else {
                widget.travellers--;
              }
            });
          } else {
            setState(() {
              widget.travellers++;
            });
          }
        },
        icon: Icon(
          widget.icon,
          size: 20,
        ),
      ),
    );
  }
}
