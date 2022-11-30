import 'package:flutter/material.dart';
import 'package:graduation_project_app/style/colors.dart';

Widget ListTable(
    {

      required List<Map> list,
      required IconData icon,
      required String firstData,
      required String secondData ,
      required String thirdData,

    }
    )=>ListView.builder(

  scrollDirection: Axis.vertical,
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemBuilder:(context,index){

    return ListTile(
      contentPadding: const EdgeInsets.only(left: 5,right: 5,top:5),
      onTap: (){
////
      },
      hoverColor: colortheme.blueGray,
      leading: Icon(
        icon,
      ),
      title:Text(list[index][firstData]),
      subtitle:Text( list[index][secondData]),
      trailing: Text(list[index][thirdData]),



    );
  },
  itemCount: list.length,

);