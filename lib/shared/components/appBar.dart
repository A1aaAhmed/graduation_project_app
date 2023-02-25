import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_app/layout/transition.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:sizer/sizer.dart';


PreferredSizeWidget bar({
  required BuildContext context,
  required String text,
  required bool morelist,
  Color backgroundcolor = colortheme.lightPurple,
  Color iconcolor = colortheme.white,
  bool bottom =false,
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
      bottom: PreferredSize(

        preferredSize: Size(100.w, 8.h),
          child:  ConditionalBuilder(
              condition: bottom,
              builder: (context) =>const Material(
                color: Colors.white,
                child: TabBar(
                  indicatorColor: colortheme.lightPurple,
                  labelColor:colortheme.lightPurple,
                  dividerColor: Colors.white,
                  tabs: [
                    Tab(child:Text("Available Tickets")),
                    Tab(child:Text("Expired Tickets")),
                  ],),
              ),
              fallback: (context) =>const Text(""),


    )));
