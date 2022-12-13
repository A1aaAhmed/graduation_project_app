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
  final String price;
  final bool view;

  const TicketComponent({Key? key,
    required this.date,
    required this.from,
    required this.to,
    required this.seat,
    required this.gate,
    required this.duration,
    required this.price,
    required this.view,


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
    String price=widget.price;
    bool late =date.year<now.year||date.year==now.year&&date.month<now.month||date.year==now.year&&date.month==now.month&&date.day<now.day||date.year==now.year&&date.month==now.month&&date.day==now.day&&date.hour<now.hour||date.year==now.year&&date.month==now.month&&date.day==now.day&&date.hour==now.hour&&date.minute<now.minute;
    return Scaffold(
    body:Sizer(
          builder:(context, orientation, deviceType) {
            return Container(
                padding:widget.view?EdgeInsetsDirectional.only(end:2.w, top:20.h):EdgeInsets.symmetric(horizontal: 5.w),
                width: double.infinity,
                height:100.h,
                child: Stack(
                    children: [
                      CustomPaint(
                        size: Size(double.infinity,100.h), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: RPSCustomPainter(),
                      ),
                      CustomPaint( //black part
                        size: Size(double.infinity,100.h), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: RPSCustomPainter2(),
                      ),
                      Padding(
                        padding: widget.view?EdgeInsetsDirectional.only(top:5.h,start:7.5.w,):EdgeInsetsDirectional.only(start:15.w,),
                        child:AutoSizedRow(
                          centerAlign: true,
                          h: widget.view?6.w:20.w,
                          item1: Wrap(
                            alignment: WrapAlignment.center,
                            direction: Axis.vertical,
                            children: [
                              AutoSizedText(
                                h: 10.h, w:14.w,
                                text:(late)?'Expired':
                                (date.day==now.day&&date.year==now.year&&date.month==now.month)?'Today':
                                DateFormat('EEEE').format(date),
                                fontSize: 10.sp,
                                maxLines: 1,
                                textColor: (late)?Colors.red:Colors.white,
                                borderRad: 1.h,
                                paddingSymHoriz: .5.w,
                                paddingSymVert: 1.h,
                                shadowCap: .3,
                              ),
                              SizedBox(height:widget.view? 30.h:10.h),
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
                            alignCenterMain: true,
                            h: (widget.view)?2.5.h:0,
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
                                      h: 8.h, w:40.w,
                                      text:  from,
                                      fontSize: 30.sp,
                                      maxLines: 1,
                                      textColor: Colors.white,
                                      align:Alignment.topLeft,
                                  ),
                                  item2: AutoSizedText(
                                      h: 8.h, w:30.w,
                                      text:  duration,
                                      fontSize: .2.sp,
                                      maxLines: 1,
                                      textColor: Colors.grey,
                                      align: Alignment.centerLeft
                                  ),
                                  item3:  AutoSizedText(
                                    h: 8.h, w:40.w,
                                    text:  to,
                                    fontSize: 30.sp,
                                    maxLines: 1,
                                    textColor: Colors.white,
                                    align: Alignment.topLeft,
                                  ),
                                )
                            ),
                            item2: (widget.view)?AutoSizedColumn(
                              h: 0,
                              item1: AutoSizedRow(
                                  h: 4.5.w,
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
                                          fontSize: .3.sp,
                                          maxLines: 1,
                                          textColor: Colors.white)
                                  ),
                                  item3: AutoSizedColumn(
                                      h: 1.h,
                                      item1:  AutoSizedText(
                                          align:Alignment.centerLeft,
                                          h: 6.h, w:20.w,
                                          text: "Boarding",
                                          fontSize: 30.sp,
                                          maxLines: 1,
                                          textColor: Colors.grey),
                                      item2: AutoSizedText(
                                        align: Alignment.centerLeft,
                                          h: 10.h, w:20.w,
                                          text: DateFormat.jm().format(date),
                                          fontSize: 30.sp,
                                          maxLines: 1,
                                          textColor: Colors.white),

                                  ),
                                  item2: AutoSizedColumn(
                                    h: 1.h,
                                    item1:  AutoSizedText(
                                        h: 6.h, w:12.w,
                                        text: "Price",
                                        fontSize: 20.sp,
                                        maxLines: 1,
                                        textColor: Colors.grey),
                                    item2: AutoSizedText(
                                        h: 10.h, w:12.w,
                                        text: price,
                                        fontSize: .3.sp,
                                        maxLines: 1,
                                        textColor: Colors.white)
                                ),
                              ),
                              item2: AutoSizedRow(
                                h: 5.w,
                                item1: AutoSizedText(
                                    h: 6.h, w:12.w,
                                    text: "Seat",
                                    fontSize: 20.sp,
                                    maxLines: 1,
                                    textColor: Colors.grey),
                                item2: AutoSizedText(
                                    align: Alignment.topLeft,
                                    h: 9.h, w:20.w,
                                    text:  seat,
                                    fontSize: .3.sp,
                                    maxLines: 1,
                                    textColor: Colors.white),),
                            ):const Text(''),
                          ),
                        ),
                      )
                    ]));
          },

    ));
  }
}
