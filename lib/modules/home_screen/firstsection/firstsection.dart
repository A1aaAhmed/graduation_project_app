import 'package:flutter/material.dart';
import 'package:graduation_project_app/shared/style/colors.dart';

class FirstSection extends StatefulWidget {
  const FirstSection({super.key});

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height * 0.3,
      decoration: BoxDecoration(
          color: colortheme.lightPurple,
           image:const DecorationImage(
              repeat: ImageRepeat.noRepeat,
              image: AssetImage('assets/images/train.png'),
             fit: BoxFit.cover,
             ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(width * .1),
            bottomRight: Radius.circular(width * .1),
          )),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text('Let\'s',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: colortheme.white,
                          fontWeight: FontWeight.bold,
                        )),
                Text('Book Your\nNext Trip ',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: colortheme.white,
                      fontWeight: FontWeight.bold,
                    )),
              ]),
        ),
      ),
    );
  }
}
