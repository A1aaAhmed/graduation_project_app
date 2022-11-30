import 'package:flutter/material.dart';
import 'package:graduation_project_app/style/colors.dart';

class Bar extends StatefulWidget implements PreferredSizeWidget {
  final String text;
  Bar({Key? key, required this.text})
      : super(
          key: key,
        );
  @override
  State<Bar> createState() => _BarState();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _BarState extends State<Bar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colortheme.lightPurple,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ), //replace with our own icon data. ) )
        title: Text(
          widget.text,
        ),
        // ignore: prefer_const_literals_to_create_immutables
      ),
      //floatingActionButton:FloatingActionButton(
      //onPressed: (){

      //},
      //child: const Icon(
      //Icons.add,
      //),
      //) ,
    );
  }
}
