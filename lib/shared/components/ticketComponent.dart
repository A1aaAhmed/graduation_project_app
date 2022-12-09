import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:intl/intl.dart';
DateTime now = DateTime.now();

Widget TicketComp ({
  required DateTime date,
  required Size size,
  required String from,
  required String to,
  String seat='',
  String gate='',
  String duration='',

})=> Center(
      child: Container(

        padding:EdgeInsetsDirectional.only(start:size.width/100 ,end: size.width/30, top: size.height/8),
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            CustomPaint(
              size: Size(size.width,(size.width*.3638*2.05).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: RPSCustomPainter(),
            ),
            CustomPaint( //black part
              size: Size(size.width,(size.width*.6*1.25).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: RPSCustomPainter2(),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top:size.height/34,start:size.width/20,),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Column(

                    children:
                    [
                      Container(
                        padding:  EdgeInsets.symmetric(horizontal:size.width/90 ,vertical:size.height/90 ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                         color: Colors.grey.withOpacity(.3),
                        ),
                        child: Text(
                          (date.day<now.day)?'Expired':
                          (date.day==now.day)?'Today':
                          DateFormat('EEEE').format(date),
                          textAlign:TextAlign.center,
                          style: TextStyle(
                            color: (date.day<now.day)?Colors.red:Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),//text
                      SizedBox(height:size.height/7),
                      Text(
                        textAlign:TextAlign.center,
                        date.day.toString(),
                        style:  const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          DateFormat('EEEE').format(date),

                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],

                  ),
                  SizedBox(width:size.width/18),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(

                            children:
                            [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child:  const Icon(
                                  Icons.circle_outlined,
                                  size: 20,
                                  color: Colors.green,
                                ),
                              ),
                              SizedBox(height:size.height/140),
                              const Dash(
                              direction: Axis.vertical,
                              length: 50,
                              dashLength: 10,
                              dashColor: Colors.grey),
                              SizedBox(height:size.height/140),
                            Container(
                            decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            ),
                            child:  const Icon(
                            Icons.circle_outlined,
                            size:20,
                            color: Colors.red,


                            ),


                            )],



                          ),
                          SizedBox(width:10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             Container(
                                width: 200,
                                child: Text(
                                  from,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize:  26,
                                  ),
                                ),
                              ),
                              SizedBox(height:10,),
                              Text(
                                duration,
                                style:  const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(height:18,),
                              Container(
                                width: 200,
                                child: Text(
                                  to,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style:  const TextStyle(
                                    color: Colors.white,
                                    fontSize:26,


                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height:size.height/35 ,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (!seat.isEmpty)? Row(
                              children: [
                                Column(

                                  children: [
                                    const Text(
                                      "Gate",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize:16,
                                      ),
                                    ),
                                    SizedBox(height:size.height/60,),
                                    Text(
                                      gate,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize:18,
                                      ),
                                    ),

                                  ],
                                ),

                                SizedBox(width:70,),
                                Column(
                                  children: [
                                    const Text(
                                      "Boarding",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize:16,
                                      ),
                                    ),
                                    SizedBox(height:size.height/60,),
                                    Text(
                                      DateFormat.jm().format(date),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize:18,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ):const Text(''),
                            SizedBox(height:size.height/60 ,),
                            (!seat.isEmpty)?Row(
                                children: [
                                  const Text(
                                    "Seat",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize:16,
                                    ),
                                  ),
                                  SizedBox(width:size.height/55,),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      seat,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize:18,
                                      ),
                                    ),
                                  )]
                            ):const Text(''),

                          ]),
                    ],
                  )

              ],
            ),
            )])));
                          //to



class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 234, 199, 226)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;


    Path path0 = Path();
    path0.moveTo(size.width*0.8983500,size.height*-0.0012000);
    path0.lineTo(size.width*0.9486700,size.height*-0.0012000);
    path0.quadraticBezierTo(size.width*0.9799500,size.height*0.0010600,size.width*1.0006500,size.height*0.0022400);
    path0.quadraticBezierTo(size.width*0.9520900,size.height*0.0507600,size.width*1.0006500,size.height*0.1004200);
    path0.quadraticBezierTo(size.width*0.9497100,size.height*0.1582400,size.width*0.9990200,size.height*0.2043200);
    path0.quadraticBezierTo(size.width*0.9503100,size.height*0.2589600,size.width*0.9995700,size.height*0.3052600);
    path0.quadraticBezierTo(size.width*0.9485200,size.height*0.3594600,size.width*0.9984000,size.height*0.4044200);
    path0.quadraticBezierTo(size.width*0.9484300,size.height*0.4564200,size.width*0.9984500,size.height*0.5045400);
    path0.quadraticBezierTo(size.width*0.9492300,size.height*0.5568000,size.width*0.9978600,size.height*0.6041400);
    path0.quadraticBezierTo(size.width*0.9492800,size.height*0.6560800,size.width*0.9978600,size.height*0.7029800);
    path0.quadraticBezierTo(size.width*0.9488200,size.height*0.7495000,size.width*0.9989800,size.height*0.8036000);
    path0.cubicTo(size.width*0.9481900,size.height*0.8500200,size.width*0.9872000,size.height*0.8941600,size.width*0.9984500,size.height*0.9017600);
    path0.quadraticBezierTo(size.width*0.9478500,size.height*0.9510400,size.width*0.9978600,size.height*1.0034400);
    path0.lineTo(size.width*0.9469900,size.height*1.0045800);
    path0.lineTo(size.width*0.8969000,size.height*1.0045800);
    path0.lineTo(size.width*0.8490600,size.height*1.0034400);
    path0.lineTo(size.width*0.2483200,size.height*1.0057400);
    path0.lineTo(size.width*0.2496600,size.height*-0.0006667);

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
class RPSCustomPainter2 extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;


    Path path0 = Path();
    path0.moveTo(size.width*0.2510000,size.height*0.0006667);
    path0.quadraticBezierTo(size.width*0.1385000,size.height*0.0006667,size.width*0.1010000,size.height*0.0006667);
    path0.cubicTo(size.width*0.0525000,size.height*0.0031667,size.width*0.0507000,size.height*0.0055000,size.width*0.0510000,size.height*0.0853333);
    path0.cubicTo(size.width*0.0506000,size.height*0.2931667,size.width*0.0498000,size.height*0.7088333,size.width*0.0494000,size.height*0.9166667);
    path0.cubicTo(size.width*0.0509000,size.height*0.9961667,size.width*0.0515000,size.height*0.9991667,size.width*0.1002000,size.height);
    path0.quadraticBezierTo(size.width*0.1378000,size.height,size.width*0.2506000,size.height);
    path0.lineTo(size.width*0.2510000,size.height*0.0006667);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}





