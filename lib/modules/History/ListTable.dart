import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/Ticket/ticketComponent/TicketComp.dart';
import 'package:graduation_project_app/modules/Ticket/ticket_screen.dart';

Widget ListTable(
    {
      required List<Map> list,
      required double h,
      required double w,
    }
    )=>ListView.builder(
    padding: EdgeInsets.zero,
    scrollDirection: Axis.vertical,

    itemBuilder:(context,index){
    return SizedBox(
      height: h,
      width: w,
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(
                  builder: ((context)=>Ticket(
                      date:DateTime.parse(list[index]['date']),
                      from: list[index]['from'],
                      to: list[index]['to'],
                      seat: list[index]['seat'],
                      gate: list[index]['gate'],
                      duration: list[index]['dur'],
                      price: list[index]['price']
                  ))));},

        child: TicketComponent(
            view: false,
            price: list[index]['price'],
            date: DateTime.parse(list[index]['date']),
            from: list[index]['from'],
            to: list[index]['to'],
            duration: list[index]['dur'],
            gate:'m',
            seat: '',
          ),
      ),
    );
      },
      itemCount: list.length,

    );