import 'package:flutter/material.dart';
import 'package:graduation_project_app/style/colors.dart';

Widget ListTable(
    {

      required List<Map> list,


    }
    )=>ListView.builder(
  scrollDirection: Axis.vertical,
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemBuilder:(context,index){

    return ListTile(
      contentPadding: const EdgeInsets.only(left: 5,right: 5,top:5),
      onTap: (){
        //to navigate and send data
        // Navigator.push(context, MaterialPageRoute(builder: (context) => OneCustomer(
        //
        //     name:list[index]['name'],
        //     Email:list[index]['email'],
        //     Bal:list[index]['balance'])));

      },
      hoverColor: colortheme.blueGray,
      leading:const Icon(
        Icons.train_rounded
      ),
      title:Text(list[index]['tripName']),
      subtitle:Text( list[index]['tripDate']),
      trailing: Text(list[index]['extraData']),


    );
  },
  itemCount: list.length,

);