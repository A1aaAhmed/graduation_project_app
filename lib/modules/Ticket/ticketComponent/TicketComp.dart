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
                padding:EdgeInsetsDirectional.only(end:2.w, top:10.h),
                width: double.infinity,
                height:100.h,
                child: Stack(
                    children: [
                      CustomPaint(
                        size: Size(double.infinity,89.5.h), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                        painter: RPSCustomPainter(),
                      ),
                      Align(
                        alignment: const Alignment(-.9,0),
                        child: Container(
                          padding: EdgeInsetsDirectional.only( top:widget.view?10.h:5.h,bottom: widget.view?10.h:5.h),
                            width: 30.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:BorderRadius.only(topLeft:Radius.circular(3.w),bottomLeft:Radius.circular(3.w))
                            ),
                            child:FittedBox(
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
                                text:(late)?'Expired':
                                (date.day==now.day&&date.year==now.year&&date.month==now.month)?'Today':
                                'Future',
                                fontSize: 13.sp,
                                maxLines: 1,
                                textColor: (late)?Colors.red:Colors.white,
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
                                  text:  date.day.toString(),
                                  fontSize: 40.sp,
                                  maxLines: 1,
                                  textColor: Colors.white,
                                  align: TextAlign.center,
                                  ),
                                  AutoSizedText(
                                  align:TextAlign.center,
                                  text: DateFormat('EEEE').format(date),
                                  fontSize: 15.sp,
                                  maxLines: 1,
                                  textColor: Colors.white),
                                ],
                              ),

                              ],
                              ),
                            ) ,
                            ),
                      ),
                      Align(
                        alignment: const Alignment(-.9,0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(start: 35.w),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Container(
                              child: AutoSizedColumn(
                                alignCenterMain: true,
                                h: (widget.view)?15.h:0,
                                item1: AutoSizedColumn(
                                    alignCenterMain: true,
                                    h: .5.h,
                                     h2: .5.h,
                                    item1: AutoSizedRow(
                                      centerAlign: true,
                                        h: 3.w,
                                        item1: AutoSizedWidget(
                                          item:  Icon(
                                            Icons.circle_outlined,
                                            size: 5.w,
                                            color: Colors.green,
                                          ),
                                        ),
                                        item2: AutoSizedText(
                                          text:  from,
                                          fontSize: 25.sp,
                                          maxLines: 1,
                                          textColor: Colors.white,
                                          align:TextAlign.left,
                                        ),),
                                    item2:Padding(
                                      padding: EdgeInsetsDirectional.only(start:2.5.w),
                                      child: AutoSizedRow(
                                        centerAlignMain: true,
                                         centerAlign: true,
                                          h: 5.w,
                                          item1: Dash(
                                                  direction: Axis.vertical,
                                                  length: 16.h,
                                                  dashLength: 2.h,
                                                  dashColor: Colors.grey,
                                                  dashThickness: .2.w,

                                                  ),
                                          item2: AutoSizedText(
                                                    text:  duration,
                                                    fontSize: 12.sp,
                                                    maxLines: 1,
                                                    textColor: Colors.grey,
                                                    align: TextAlign.left
                                            ),),
                                    ),
                                    item3: AutoSizedRow(
                                      centerAlign: true,
                                      h: 3.w,
                                        item1: AutoSizedWidget(
                                        item: Icon(
                                          Icons.circle_outlined,
                                          size: 5.w,
                                          color: Colors.red,
                                        ),
                                      ),
                                      item2: AutoSizedText(
                                        text:  to,
                                        fontSize: 25.sp,
                                        maxLines: 1,
                                        textColor: Colors.white,
                                        align:TextAlign.left,
                                      ),
                                    )
                                ),
                                item2: (widget.view)?AutoSizedColumn(
                                  h: 4.h,
                                  item1: AutoSizedRow(
                                    h: 4.5.w,
                                    h2: 4.5.w,
                                    item1: AutoSizedColumn(
                                      alignCenter: true,
                                        h: 1.h,
                                        item1:  AutoSizedText(
                                            text: "Gate",
                                            fontSize: 15.sp,
                                            maxLines: 1,
                                            textColor: Colors.grey,
                                            align:TextAlign.center
                                        ),
                                        item2: AutoSizedText(
                                          text:  gate,
                                          fontSize: 15.sp,
                                          maxLines: 1,
                                          textColor: Colors.white,
                                          align: TextAlign.center,
                                        )
                                    ),
                                    item3: AutoSizedColumn(
                                      alignCenter: true,
                                      h: 1.h,
                                      item1:  AutoSizedText(
                                        align:TextAlign.center,
                                        text: "Boarding",
                                        fontSize: 15.sp,
                                        maxLines: 1,
                                        textColor: Colors.grey,
                                      ),
                                      item2: AutoSizedText(
                                          align: TextAlign.center,
                                          text: DateFormat.jm().format(date),
                                          fontSize: 15.sp,
                                          maxLines: 1,
                                          textColor: Colors.white),

                                    ),
                                    item2: AutoSizedColumn(
                                        alignCenter: true,
                                        h: 1.h,
                                        item1:  AutoSizedText(
                                            text: "Price",
                                            fontSize: 15.sp,
                                            maxLines: 1,
                                            textColor: Colors.grey,
                                            align:TextAlign.center
                                        ),
                                        item2: AutoSizedText(
                                            text: price,
                                            fontSize: 15.sp,
                                            maxLines: 1,
                                            align: TextAlign.center,
                                            textColor: Colors.white)
                                    ),
                                  ),
                                  item2: AutoSizedRow(
                                    h: 5.w,
                                    item1: AutoSizedText(
                                        text: "Seat",
                                        fontSize: 15.sp,
                                        maxLines: 1,
                                        textColor: Colors.grey,
                                        align: TextAlign.center
                                    ),
                                    item2: AutoSizedText(
                                        align: TextAlign.center,
                                        text: seat,
                                        fontSize: 15.sp,
                                        maxLines: 1,
                                        textColor: Colors.white),),
                                ):const Text(''),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // AutoSizedRow(
                      //   h: 2.w,
                      //   item1:
                      //   item2:
                      // )
                    ]));
          },

    ));
  }
}
