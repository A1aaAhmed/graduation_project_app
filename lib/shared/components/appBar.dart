import 'package:flutter/material.dart';
import 'package:graduation_project_app/layout/transition.dart';
import 'package:graduation_project_app/shared/style/colors.dart';

class Bar extends StatefulWidget implements PreferredSizeWidget {
  final String text;
  final bool moreList = false;
  const Bar({Key? key, required this.text, required bool morelist})
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
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              // We have no active routes, so we can't pop.
              Navigator.pop(context);
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Transition()),
              );
            }
          },
          icon: const Icon(Icons.arrow_back_ios),
        ), //replace with our own icon data. ) )
        title: Text(
          widget.text,
        ),
        actions: [
          widget.moreList
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert_rounded,
                  ))
              : const Text('')
        ],
        // ignore: prefer_const_literals_to_create_immutables
      ),
    );
  }
}

PreferredSizeWidget bar({
  required BuildContext context,
  required String text,
  required bool morelist,
  Color backgroundcolor = colortheme.lightPurple,
  Color iconcolor = colortheme.white,
}) =>
    AppBar(
      backgroundColor: backgroundcolor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          if (text=='Previous tickets' || text=='Current ticket'||text=='Live location' ||
              text == 'Profile') {
                       Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Transition()),
            );
          } else {
            Navigator.pop(context);
          }
      
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: iconcolor,
        ),
      ), //replace with our own icon data. ) )
      title: Text(
        text,
      ),
      actions: [
        morelist
            ? IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_rounded,
                ))
            : const Text('')
      ],
      // ignore: prefer_const_literals_to_create_immutables
    );
