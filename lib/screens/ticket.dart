import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ticket extends StatefulWidget {
  const Ticket({Key? key}) : super(key: key);

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    final Size size  =MediaQuery.of(context).size;
    return Center(
      child: Container(
        padding: const EdgeInsetsDirectional.all(50),
        width: size.width,
        height: size.height/1.5,
        child: Stack(
          children: [

            Stack(
              children: [
                CustomPaint(
                size: Size(size.width,(size.width*.3638).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: RPSCustomPainter(),
              ),
            ],),
            Stack(
              children:
              [
                CustomPaint(
                size: Size(size.width,(size.width*.6).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: RPSCustomPainter2(),
              ),],
            ),
          ],
        ),
      ),
    );
  }
}
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





