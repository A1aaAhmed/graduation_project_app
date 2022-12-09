import 'package:flutter/material.dart';
import 'package:graduation_project_app/main.dart';
import 'package:graduation_project_app/style/colors.dart';
class Bar extends StatefulWidget implements PreferredSizeWidget {
  final String text;
  final bool moreList;
  const Bar({Key? key, required this.text,required this.moreList})
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

            if (Navigator.canPop(context)) {
              // We have no active routes, so we can't pop.
              Navigator.pop(context);
            }
            else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );

            }
          },
          icon: const Icon(Icons.arrow_back_ios),
        ), //replace with our own icon data. ) )
        title: Text(
          widget.text,
        ),
        actions: [
          widget.moreList?IconButton(
              onPressed: (){},
              icon:const Icon(
                Icons.more_vert_rounded,
              )
          ):const Text('')
        ],
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
