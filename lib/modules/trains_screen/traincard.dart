import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/seats_screen/seats_layout.dart';
import 'package:graduation_project_app/shared/style/colors.dart';

Widget TrainCard({
  required context,
  required data,
  required from,
  required to,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ClipPath(
        clipper: CardClipper(),
        child: GestureDetector(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const Seats()))),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              color: Colors.white70,
              child: Row(children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          const Icon(
                            Icons.circle,
                            color: colortheme.saimon,
                            size: 15,
                          ),
                          Text(
                            ' $from',
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ]),
                        const Text(
                          '  |\n  |\n  |',
                          style: TextStyle(
                              color: colortheme.saimon,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(children: [
                          const Icon(
                            Icons.circle,
                            color: colortheme.green,
                            size: 15,
                          ),
                          Text(
                            ' $to',
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ]),
                      ]),
                )),
                Container(
                  color: colortheme.blueGray,
                  width: 1,
                  height: MediaQuery.of(context).size.height * 0.2 * 0.5,
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * .23,
                    padding: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    child: Text(
                      '$data',
                      style: const TextStyle(fontSize: 15),
                    ))
              ])),
        ),
      ),
    );

class CardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();

    path0.lineTo(0, size.height);
    path0.lineTo(size.width * 0.65, size.height);
    path0.quadraticBezierTo(size.width * 0.65, size.height * 0.75,
        size.width * 0.72, size.height * 0.75);
    path0.quadraticBezierTo(
        size.width * 0.79, size.height * 0.75, size.width * 0.79, size.height);
    path0.lineTo(size.width, size.height);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width * 0.79, 0);
    path0.quadraticBezierTo(size.width * 0.79, size.height * 0.25,
        size.width * 0.72, size.height * 0.25);
    path0.quadraticBezierTo(
        size.width * 0.65, size.height * 0.25, size.width * 0.65, 0);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
