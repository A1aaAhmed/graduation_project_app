import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:graduation_project_app/component/appBar.dart';
import 'package:graduation_project_app/style/colors.dart';

class TrainsScreen extends StatelessWidget {
  final String from;
  final String to;
  final String date;

  TrainsScreen({
    super.key,
    required this.from,
    required this.to,
    required this.date,
  });

  final List data = [
    '10:00 am',
    '01:00 pm',
    '03:00 pm',
    '05:00 pm',
    '10:00 pm'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colortheme.lightPurple,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        color: colortheme.lightPurple,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '   $from to $to',
              style: TextStyle(
                color: colortheme.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '      $date',
              style: TextStyle(
                color: colortheme.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: colortheme.white,
                  borderRadius: BorderRadiusDirectional.only(
                    topStart:
                        Radius.circular(MediaQuery.of(context).size.width * .1),
                    topEnd:
                        Radius.circular(MediaQuery.of(context).size.width * .1),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.08,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 35, left: 20, right: 20),
                        child: Text(
                          '${data.length} Trains Found',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: ((context, index) =>
                            traincard(context, data[index])),
                        itemCount: data.length,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget traincard(context, data) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ClipPath(
          clipper: cardclipper(),
          child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Card(
                child: Row(children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Icon(
                              Icons.circle,
                              color: colortheme.saimon,
                              size: 15,
                            ),
                            Text(
                              ' $from',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ]),
                          Text(
                            '  |\n  |\n  |',
                            style: TextStyle(
                                color: colortheme.saimon,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(children: [
                            Icon(
                              Icons.circle,
                              color: colortheme.green,
                              size: 15,
                            ),
                            Text(
                              ' $to',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ]),
                        ]),
                  )),
                  Container(
                    color: colortheme.blueGray,
                    width: 1,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        '$data',
                        style: TextStyle(fontSize: 15),
                      ))
                ]),
              )),
        ),
      );
}

class cardclipper extends CustomClipper<Path> {
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
