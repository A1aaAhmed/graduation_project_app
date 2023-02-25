import 'package:flutter/material.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:sizer/sizer.dart';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({
    super.key
  });
  @override
  State<LoadingScreen> createState() => _LoadingState();
}

class _LoadingState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Sizer(
          builder: (context, orientation, deviceType) {
            return const Scaffold(
              body:
                  Center(
                      child: CircularProgressIndicator(
                        color:colortheme.lightPurple,
                      )
                  ));

          }),
    );
  }
}
