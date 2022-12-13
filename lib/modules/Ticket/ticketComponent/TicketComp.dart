import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:graduation_project_app/modules/Ticket/ticketComponent/autoSizeColum.dart';
import 'package:graduation_project_app/modules/Ticket/ticketComponent/autoSizeText.dart';
import 'package:graduation_project_app/modules/Ticket/ticketComponent/autoSizedRow.dart';
import 'package:graduation_project_app/modules/Ticket/ticketComponent/autoSizedWidget.dart';
import 'package:graduation_project_app/modules/Ticket/ticketComponent/ticketCustomPaint.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class TicketComponent extends StatefulWidget {
  final DateTime date;
  final String from;
  final String to;
  final String seat;
  final String gate;
  final String duration;

  const TicketComponent({Key? key,
    required this.date,
    required this.from,
    required this.to,
    required this.seat,
    required this.gate,
    required this.duration,

  }) : super(key: key);
  @override
  State<TicketComponent> createState() => _TicketComponentState();
}
class _TicketComponentState extends State<TicketComponent> {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime date=widget.date;
    String from=widget.from;
    String to=widget.to;
    String seat=widget.seat;
    String gate=widget.gate;
    String duration=widget.duration;
    return Scaffold(
    body:Sizer(
          builder:(context, orientation, deviceType) {
            return Center(
                child: Container(
                    padding:EdgeInsetsDirectional.only(end:2.w, top:20.h),
                    width: 100.w,
                    height:100.h,
                    child: Stack(
                        children: [
                          CustomPaint(
                            size: Size(100.w,79.65.h), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                            painter: RPSCustomPainter(),
                          ),
                          CustomPaint( //black part
                            size: Size(100.w,100.h), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                            painter: RPSCustomPainter2(),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.only(top:5.h,start:7.5.w,),
                            child:AutoSizedRow(
                              h: 6.w,
                              item1: Wrap(
                                direction: Axis.vertical,
                                children: [
                                  AutoSizedText(
                                    h: 10.h, w:14.w,
                                    text:(date.day<now.day)?'Expired':
                                    (date.day==now.day)?'Today':
                                    DateFormat('EEEE').format(date),
                                    fontSize: 10.sp,
                                    maxLines: 1,
                                    textColor: (date.day<now.day)?Colors.red:Colors.white,
                                    borderRad: 1.h,
                                    paddingSymHoriz: .5.w,
                                    paddingSymVert: 1.h,
                                    shadowCap: .3,
                                  ),
                                  SizedBox(height:30.h),
                                  AutoSizedText(
                                    h: 15.h, w:15.w,
                                    text:  date.day.toString(),
                                    fontSize: 50.sp,
                                    maxLines: 1,
                                    textColor: Colors.white,
                                  ),
                                  AutoSizedText(
                                    align: Alignment.topCenter,
                                      h: 12.h, w:15.w,
                                      text: DateFormat('EEEE').format(date),
                                      fontSize: 10.sp,
                                      maxLines: 1,
                                      textColor: Colors.white),
                                ],
                              ),
                              item2: AutoSizedColumn(
                                h: 2.5.h,
                                item1: AutoSizedRow(
                                    h: 3.w,
                                    item1: AutoSizedColumn(
                                      alignCenter: true,
                                      h: 1.h,
                                      item1: AutoSizedWidget(
                                        h: 5.h,
                                        w: 6.w ,
                                        item: const Icon(
                                          Icons.circle_outlined,
                                          size: 50,
                                          color: Colors.green,
                                        ),
                                      ),
                                      item2:  Dash(
                                        direction: Axis.vertical,
                                        length: 20.h,
                                        dashLength: 2.h,
                                        dashColor: Colors.grey,

                                      ),
                                      item3:  AutoSizedWidget(
                                        h: 5.h,
                                        w: 6.w ,
                                        item: const Icon(
                                          Icons.circle_outlined,
                                          size: 50,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    item2:  AutoSizedColumn(
                                      h: 5.h,
                                      h2: 5.h,
                                      item1: AutoSizedText(
                                          h: 8.h, w:30.w,
                                          text:  from,
                                          fontSize: 10.sp,
                                          maxLines: 1,
                                          textColor: Colors.white,
                                          align:Alignment.topLeft,
                                      ),
                                      item2: AutoSizedText(
                                          h: 8.h, w:10.w,
                                          text:  duration,
                                          fontSize: 1.sp,
                                          maxLines: 1,
                                          textColor: Colors.white,
                                          align: Alignment.topLeft
                                      ),
                                      item3:  AutoSizedText(
                                        h: 8.h, w:30.w,
                                        text:  to,
                                        fontSize: 10.sp,
                                        maxLines: 1,
                                        textColor: Colors.white,
                                        align: Alignment.topLeft,
                                      ),
                                    )
                                ),
                                item2: (seat.isNotEmpty)?AutoSizedColumn(
                                  h: 0,
                                  item1: AutoSizedRow(
                                      h: 5.w,
                                      item1: AutoSizedColumn(
                                          h: 1.h,
                                          item1:  AutoSizedText(
                                              h: 6.h, w:12.w,
                                              text: "Gate",
                                              fontSize: 20.sp,
                                              maxLines: 1,
                                              textColor: Colors.grey),
                                          item2: AutoSizedText(
                                              h: 10.h, w:12.w,
                                              text:  gate,
                                              fontSize: 25.sp,
                                              maxLines: 1,
                                              textColor: Colors.white)
                                      ),
                                      item2: AutoSizedColumn(
                                          h: 1.h,
                                          item1:  AutoSizedText(
                                              align:Alignment.centerLeft,
                                              h: 6.h, w:12.w,
                                              text: "Time",
                                              fontSize: 20.sp,
                                              maxLines: 1,
                                              textColor: Colors.grey),
                                          item2: AutoSizedText(
                                            align: Alignment.centerLeft,
                                              h: 11.h, w:12.w,
                                              text: DateFormat.jm().format(date),
                                              fontSize: 25.sp,
                                              maxLines: 1,
                                              textColor: Colors.white)
                                      )
                                  ),
                                  item2: AutoSizedRow(
                                    h: 5.w,
                                    item1: AutoSizedText(
                                        h: 8.h, w:12.w,
                                        text: "Seat",
                                        fontSize: 20.sp,
                                        maxLines: 1,
                                        textColor: Colors.grey),
                                    item2: AutoSizedText(
                                        align: Alignment.centerLeft,
                                        h: 8.h, w:30.w,
                                        text:  seat,
                                        fontSize: 25.sp,
                                        maxLines: 1,
                                        textColor: Colors.white),),
                                ):const Text(''),
                              ),
                            ),
                          )
                        ])));
          },

    ));
  }
}
