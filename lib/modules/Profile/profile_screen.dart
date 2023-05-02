import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:graduation_project_app/layout/cubit/cubit.dart';
import 'package:graduation_project_app/layout/cubit/states.dart';
import 'package:graduation_project_app/models/user.dart';
import 'package:graduation_project_app/modules/Profile/editProfile_Screen.dart';
import 'package:graduation_project_app/network/local/shared_pref.dart';
import 'package:graduation_project_app/shared/components/appBar.dart';
import 'package:graduation_project_app/shared/components/loading.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
import 'package:graduation_project_app/shared/variables.dart';

import 'package:restart_app/restart_app.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {
        
        MainCubit.get(context).profileImage;
      },
      builder: (context, state) {
        
        var userModeldata = MainCubit.model;

        return Scaffold(
            appBar: bar(context: context, text: 'Profile', morelist: false),
            body: ConditionalBuilder(
              condition: MainCubit.model != null,
              builder: (context) => SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: (height * 0.24) + 60,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Container(
                              width: width,
                              height: height * 0.24,
                              decoration: BoxDecoration(
                                  color: colortheme.lightPurple,
                                  image: const DecorationImage(
                                    repeat: ImageRepeat.noRepeat,
                                    image:
                                        AssetImage('assets/images/train.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(width * .1),
                                    bottomRight: Radius.circular(width * .1),
                                  )),
                            ),
                          ),
                          CircleAvatar(
                            radius: 73,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 70,
                              backgroundImage:
                                  NetworkImage('${userModeldata!.image!}'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: colortheme.lightPurple,
                              border: Border.all(
                                  width: 2, color: colortheme.lightPurple),
                              borderRadius: BorderRadius.all(
                                Radius.elliptical(25, 25),
                              )),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 1, horizontal: 55),
                            child: TextButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            editProfileScreen())));
                              },
                              icon: Icon(
                                Icons.edit,
                                color: colortheme.lightGray,
                                size: 17,
                              ),
                              label: Text(
                                'edit profile',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: colortheme.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        children: [
                          const Icon(Icons.person),
                          const SizedBox(
                            width: 7,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'name:',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: colortheme.black,
                                    ),
                              ),
                              Text(
                                '${userModeldata!.name!}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: colortheme.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        children: [
                          const Icon(Icons.email),
                          const SizedBox(
                            width: 7,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: colortheme.black,
                                    ),
                              ),
                              Text(
                                '${userModeldata.email}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: colortheme.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        children: [
                          const Icon(Icons.phone_android),
                          const SizedBox(
                            width: 7,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'phone',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: colortheme.black,
                                    ),
                              ),
                              Text(
                                '${userModeldata!.uId!}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: colortheme.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Row(
                        children: [
                          const Icon(Icons.bookmark_add),
                          const SizedBox(
                            width: 7,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'bill',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: colortheme.black,
                                    ),
                              ),
                              Text(
                                '${userModeldata!.bill!}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: colortheme.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    TextButton.icon(
                      onPressed: () async {
                        await GoogleSignIn().signOut();
                        await FirebaseAuth.instance.signOut().then((value) {
                          uId = '';
                          MainCubit.uId = '';
                          MainCubit.model = UserModel();
                          print('out  ${MainCubit.uId}');
                          casheHelper.removeData(key: 'uId');
                          Restart.restartApp();
                        });
                      },
                      icon:
                          const Icon(Icons.logout_outlined, color: Colors.red),
                      label: Text(
                        'SIGN OUT',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
              fallback: (context) => const LoadingScreen(),
            ));
      },
    );
  }
}
