import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/seats_screen/widgets/trainpart.dart';
import 'package:graduation_project_app/shared/style/colors.dart';

class TheMainTrain extends StatefulWidget {
  final double width;
  final double height;
  const TheMainTrain({super.key, required this.width, required this.height});

  @override
  State<TheMainTrain> createState() => _TheMainTrainState();
}

class _TheMainTrainState extends State<TheMainTrain> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              width: widget.width * 0.47,
              height: widget.height * 0.67,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(widget.width * 0.3),
                      topRight: Radius.circular(widget.width * 0.3),
                      bottomLeft: Radius.circular(widget.height * 0.03),
                      bottomRight: Radius.circular(widget.height * 0.03))),
              child: const TrainPart(start: 1),
            ),
            Container(
              margin: EdgeInsets.only(top: widget.height * 0.03),
              width: widget.width * 0.387,
              height: widget.height * 0.11,
              decoration: BoxDecoration(
                  color: colortheme.blueGray,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(widget.width * 0.3),
                      topRight: Radius.circular(widget.width * 0.3))),
            ),
          ],
        ),
        Container(
          width: widget.width * 0.47,
          height: widget.height * 0.54,
          margin: EdgeInsets.symmetric(vertical: widget.height * 0.03),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(widget.height * 0.03)),
          child: const TrainPart(start: 17),
        ),
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              width: widget.width * 0.47,
              height: widget.height * 0.67,
              margin: EdgeInsets.only(bottom: widget.height * 0.03),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(widget.height * 0.03),
                      topRight: Radius.circular(widget.height * 0.03),
                      bottomLeft: Radius.circular(widget.width * 0.3),
                      bottomRight: Radius.circular(widget.width * 0.3))),
              child: const TrainPart(start: 33),
            ),
            Container(
              margin: EdgeInsets.only(bottom: widget.height * 0.06),
              width: widget.width * 0.387,
              height: widget.height * 0.11,
              decoration: BoxDecoration(
                  color: colortheme.blueGray,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(widget.width * 0.3),
                      bottomRight: Radius.circular(widget.width * 0.3))),
            ),
          ],
        ),
      ],
    );
  }
}
