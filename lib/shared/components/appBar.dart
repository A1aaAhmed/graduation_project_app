import 'package:flutter/material.dart';
import 'package:graduation_project_app/layout/transition.dart';
import 'package:graduation_project_app/models/ticket.dart';
import 'package:graduation_project_app/modules/Ticket/allTickets.dart';
import 'package:graduation_project_app/modules/Ticket/cubit/cubit.dart';
import 'package:graduation_project_app/modules/Ticket/timeFuns.dart';
import 'package:graduation_project_app/shared/components/alertDialog.dart';
import 'package:graduation_project_app/shared/components/components.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:sizer/sizer.dart';

PreferredSizeWidget bar({
  required BuildContext context,
  required String text,
  required bool morelist,
  Color backgroundcolor = colortheme.lightPurple,
  Color iconcolor = colortheme.white,
  bool bottom = false,
  TicketModel ?ticket,
}) => AppBar(
                leading: IconButton(
                  onPressed: () {
                    if (text == 'My Tickets' ||
                        text == 'Current Ticket' ||
                        text == 'Live location' ||
                        text == 'Profile') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Trans()),
                      );
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ), //replace with our own icon data. ) )
                title: Text(
                  text,
                ),
                actions: [
                  morelist&&(text=="My Tickets"||text=="Current Ticket")
                ? PopupMenuButton(
                  itemBuilder: (context){

                return [
                     PopupMenuItem<int>(
                     value: 0,
                     child:text=="My Tickets"? const Text("Delete previous Tickets"):expired(ticket!.date)?const Text("Delete Ticket"):const Text("Cancel my book"),
                    ),
                    ];
                    },
                    onSelected:(value){
                      TicketCubit();
                    if(value == 0&&text=="My Tickets"){
                      Alert(checkText: "Delete all my previous tickets?", context: context, confirmFun:() {
                         TicketCubit.get(context).deleteAllExpired();
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: ((context) =>const TicketsView())));
                      }
                      );
                    }
                    else if(value == 0&&text=="Current Ticket"){
                      if (isToday(ticket?.date)&&!expired(ticket!.date)){
                        showToast(status: toastStates.ERROR,text: "You can't cancel today's trips");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>const TicketsView())));
                      }
                      else{
                          Alert(checkText: expired(ticket!.date)?"Delete Ticket?":"Cancel my trip?", context: context, confirmFun: (){
                          expired(ticket.date)?TicketCubit.get(context).deleteExpiredTicket(ticket):TicketCubit.get(context).deleteTicket(ticket);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>const TicketsView())));
                        });
                      }
                    }
                    }
                )
               :const Text('')
                ],
                bottom: bottom == true
                    ? PreferredSize(
                        preferredSize: Size(100.w, 8.h),
                        child: const Material(
                          color: Colors.white,
                          child: TabBar(
                            indicatorColor: colortheme.lightPurple,
                            labelColor: colortheme.lightPurple,
                            dividerColor: Colors.white,
                            tabs: [
                              Tab(child: Text("Available Tickets")),
                              Tab(child: Text("Expired Tickets")),
                            ],
                          ),
                        ))
                    : PreferredSize(
                        preferredSize: Size(0.w, 0.h),
                        child: Container(),
                      ),
          );
