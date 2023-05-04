// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:graduation_project_app/models/ticket.dart';
import 'package:graduation_project_app/modules/Ticket/timeFuns.dart';
import 'package:graduation_project_app/modules/Ticket/ticketComponent/autoSizeColum.dart';
import 'package:graduation_project_app/modules/Ticket/ticketComponent/autoSizeText.dart';
import 'package:graduation_project_app/modules/Ticket/ticketComponent/autoSizedRow.dart';
import 'package:graduation_project_app/modules/Ticket/ticketComponent/autoSizedWidget.dart';
import 'package:graduation_project_app/modules/Ticket/ticketComponent/ticketCustomPaint.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class TicketComponent extends StatefulWidget {
  final bool view;
  final TicketModel ticket;
  const TicketComponent({
    Key? key,
    required this.ticket,
    required this.view,
  }) : super(key: key);
  @override
  State<TicketComponent> createState() => _TicketComponentState();
}

class _TicketComponentState extends State<TicketComponent> {
  @override
  Widget build(BuildContext context) {
    DateTime date = widget.ticket.date;
    String from = widget.ticket.from;
    String to = widget.ticket.to;
    String seat = widget.ticket.seats;
    String train = widget.ticket.train;
    String price = widget.ticket.price;
    bool late = expired(date);
    return Scaffold(
          body: Container(
          padding: EdgeInsetsDirectional.only(end: 2.w, top: 5.h),
          child: Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 7.w),
            child: Stack(
                children: [
              CustomPaint(
                size: Size(double.infinity,
                   94.5.h), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: RPSCustomPainter(),
              ),
              Container(
                width: 30.w,
                decoration: BoxDecoration(
                    color:const Color.fromARGB(255, 234, 199, 226),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(3.w),
                        bottomLeft: Radius.circular(3.w)),
                ),
                padding: EdgeInsetsDirectional.only( end: 10.w) ,
                child: Container(
                  height: 100.h,
                  padding: EdgeInsetsDirectional.only(
                      top:  5.h,
                      bottom: 5.h
                  ),
                  width: 25.w,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3.w),
                          bottomLeft: Radius.circular(3.w))),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      direction: Axis.vertical,
                      spacing: 30.h,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 20.w,
                          child: AutoSizedText(
                            w: 20.w,
                            text: (late)
                                ? 'Expired'
                                :isToday(date)
                                    ? 'Today'
                                    : 'Future',
                            fontSize: 13.sp,
                            maxLines: 1,
                            textColor: (late) ? Colors.red : Colors.white,
                            borderRad: 1.h,
                            paddingSymHoriz: 1.w,
                            paddingSymVert: 2.h,
                            shadowCap: .3,
                            align: TextAlign.center,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AutoSizedText(
                              w: 20.w,
                              text: date.day.toString(),
                              fontSize: 40.sp,
                              maxLines: 1,
                              textColor: Colors.white,
                              align: TextAlign.center,
                            ),
                            AutoSizedText(
                                w: 29.w,
                                align: TextAlign.center,
                                text: late?DateFormat.MMMM().format(date):DateFormat('EEEE').format(date),
                                fontSize: 15.sp,
                                maxLines: 1,
                                textColor: Colors.white),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: widget.view?EdgeInsetsDirectional.only(start: 25.w,top: 1.h) :EdgeInsetsDirectional.only(start: 25.w),
                  child: AutoSizedColumn(
                    alignCenterMain: widget.view ?false:true,
                    h:0,
                    item1: AutoSizedColumn(
                        alignCenterMain: true,
                        h: 0,
                        h2: 0,
                        item1: AutoSizedRow(
                          centerAlign: true,
                          h: 3.w,
                          item1: AutoSizedWidget(
                            item: Icon(
                              Icons.circle_outlined,
                              size: 3.w,
                              color: Colors.green,
                            ),
                          ),
                          item2:Expanded(
                            child: Container(
                              height: 10.h,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsetsDirectional.only(end:5.w ),
                              child: Text(
                                from,
                                maxLines: widget.view ?2:1,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                  fontSize: widget.view ?25:27 ,
                                ),
                              ),
                            ),
                          ) ,
                        ),
                        item2: AutoSizedRow(
                          centerAlign: true,
                          h: 2.w,
                          item1: Padding(
                            padding: EdgeInsetsDirectional.only(start: 1.2.w),
                            child: Dash(
                              direction: Axis.vertical,
                              length:widget.view ? 6.h:6.h ,
                              dashLength: 1.5.h,
                              dashColor: Colors.grey,
                              dashThickness: .5.w,
                            ),
                          ),
                          item2: Padding(
                            padding: EdgeInsetsDirectional.only(start: 2.w),
                            child: Text(
                              DateFormat.jm().format(date),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: widget.view ?16:18 ,
                              ),
                            ),
                          ) ,
                        ),
                        item3: AutoSizedRow(
                          centerAlign: true,
                          h: 3.w,
                          item1: AutoSizedWidget(
                            item: Icon(
                              Icons.circle_outlined,
                              size:3.w,
                              color: Colors.red,
                            ),
                          ),
                          item2:Expanded(
                            child: Container(
                              height: 10.h,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsetsDirectional.only(end:5.w ),
                              child: Text(
                                to,
                                maxLines: widget.view ?2:1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: widget.view ?25:27 ,
                                )),
                            ),
                          ),
                        )
                    ),
                    item2: (widget.view)
                        ? AutoSizedColumn(
                           hInti: 5.h,
                            h: 5.h,
                            item1: AutoSizedRow(
                              centerAlign: true,
                              h:3.w,
                              item1: AutoSizedColumn(
                                alignCenterMain: true,
                                h: 2.h,
                                item1:const Text(
                                    "Price",
                                    maxLines: 1,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.grey,
                                      fontSize:20 ,
                                    )),
                                item2:Text(
                                    price,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                      fontSize:18 ,
                                    )),
                              ),
                
                              item2: AutoSizedColumn(
                                alignCenter: true,
                                alignCenterMain: true,
                                h: 2.h,
                                item1: const Text(
                                    "Train",
                                    maxLines: 1,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.grey,
                                      fontSize:20 ,
                                    )),
                                item2: Text(
                                    train,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize:18 ,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                              ),
                            ),
                            item2: AutoSizedRow(
                              centerAlign: true,
                              h: 3.w,
                              item1: const Text(
                                  "Seats",
                                  maxLines: 1,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.grey,
                                    fontSize:20 ,
                                  )),
                              item2: Expanded(
                                child: Container(
                                  padding: EdgeInsetsDirectional.only(end:5.w ),
                                  child: Text(
                                      seat,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.white,
                                        fontSize:18 ,
                                      )),
                                ),
                              ),
                            ),
                
                          )
                        : const Text(''),
                  ),
                ),
              ),

            ]),
          )));
  }
}
