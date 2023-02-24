import 'package:flutter/material.dart';
import 'package:graduation_project_app/layout/transition.dart';
import 'package:graduation_project_app/shared/style/colors.dart';


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
          if (text=='Previous Tickets' || text=='Current Tickets'||text=='Live location' ||
              text == 'Profile') {
                       Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Trans()),
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
