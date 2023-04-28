import 'package:flutter/material.dart';
import 'package:graduation_project_app/modules/seats_screen/seats_layout.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:graduation_project_app/widgets/global.dart';
import 'package:intl/intl.dart';

import '../../shared/variables.dart';

Widget SearchCard(
        {required context,
        required time,
        required Map<String, dynamic> train,
        required trainNUM}) {
        String  available=train['available'][DateFormat.E()
                          .format(DateTime.parse(depart))
                          .toString()];
   return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ClipPath(
        clipper: CardClipper(),
        child: GestureDetector(
          onTap: () {
            // print(train);
            // print(train['trainClasses']['1st class']);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => Seats(
                          train: train,
                          time: time,
                          trainNUM: trainNUM,
                        ))));
          },
          child: Container(
              height: MediaQuery.of(context).size.height * 0.27,
              color: int.parse(available) >=
                      seats
                  ? Colors.white70
                  : colortheme.saimon.withOpacity(0.5),
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
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ]),
                        Container(
                          color: colortheme.saimon,
                          width: 1.5,
                          height:
                              MediaQuery.of(context).size.height * 0.2 * 0.15,
                        ),
                        Row(children: [
                          const Icon(
                            Icons.circle,
                            color: colortheme.green,
                            size: 15,
                          ),
                          Text(
                            ' $to',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ]),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          ' Train Number : $trainNUM',
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          ' available seats : $available',
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
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
                      '$time',
                      style: Theme.of(context).textTheme.bodySmall,
                    ))
              ])),
        ),
      ),
    );}

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
