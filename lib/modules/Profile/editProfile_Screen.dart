import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project_app/layout/cubit/cubit.dart';
import 'package:graduation_project_app/layout/cubit/states.dart';
import 'package:graduation_project_app/modules/Profile/profile_screen.dart';
import 'package:graduation_project_app/shared/components/components.dart';
import 'package:graduation_project_app/shared/style/colors.dart';

import '../../shared/components/button.dart';
import '../../shared/variables.dart';

class editProfileScreen extends StatelessWidget {
  const editProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // var nameController = TextEditingController();
    // var emailController = TextEditingController();
    // var phoneController = TextEditingController();
    var formkey = GlobalKey<FormState>();
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {
        // MainCubit.get(context).profileImage;
      },
      builder: (context, state) {
        var userModeldata = MainCubit.model;
        var editedProfileImage = MainCubit.get(context).profileImage;

        // nameController.text = userModeldata!.name!;
        // emailController.text = userModeldata!.email!;
        phoneController.text = userModeldata!.uId!;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios)),
            title: Text(
              'edit your profile',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colortheme.lightGray,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state is updateUserLoadingState) LinearProgressIndicator(),
                 if (state is updateUserLoadingState)
                   SizedBox(
                    height: 5,
                   ),
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
                                image: AssetImage('assets/images/train.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(width * .1),
                                bottomRight: Radius.circular(width * .1),
                              )),
                        ),
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 73,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 70,
                              backgroundImage: editedProfileImage == null
                                  ? NetworkImage('${userModeldata!.image!}')
                                      as ImageProvider
                                  : FileImage(editedProfileImage),
                            ),
                          ),
                          CircleAvatar(
                              child: Center(
                            child: IconButton(
                              onPressed: () {
                                MainCubit.get(context).getImage();
                              },
                              icon: Icon(
                                Icons.add_a_photo,
                                size: 24,
                              ),
                            ),
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                if (MainCubit.get(context).profileImage != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: defultButton(
                        context: context,
                        background: colortheme.lightPurple,
                        function: ()  {
                          nameController.text = userModeldata!.name!;
                          emailController.text = userModeldata!.email!;
                          MainCubit.get(context).uploadImage(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text, context: context);
                        },
                        text: 'Upload profile photo'),
                  ),
                // if (state is updateUserLoadingState)
                //   SizedBox(
                //     height: 5,
                //   ),
                // if (state is updateUserLoadingState) LinearProgressIndicator(),
                // SizedBox(
                //   height: 20,
                // ),
                
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      defualtForm(
                        read: false,
                        prefix: Icons.person,
                        controller: nameController,
                        inputType: TextInputType.name,
                        validator: 'name must not be empty',
                        lable: 'enter your name',
                        // onsubmit: (s) {
                        //   nameController.text = s;
                        // }
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defualtForm(
                        read: false,
                        prefix: Icons.email,
                        controller: emailController,
                        inputType: TextInputType.emailAddress,
                        validator: 'email must not be empty',
                        lable: 'enter your email',
                        // onsubmit: (s) {
                        //   emailController.text = s;
                        // }
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      defualtForm(
                        read: true,
                        prefix: Icons.phone,
                        controller: phoneController,
                        inputType: TextInputType.phone,
                        validator: 'phone must not be empty',
                        lable: 'enter your phone',
                        // onsubmit: (s) {
                        //   phoneController.text = s;
                        // }
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      button(
                          text: 'Update',
                          width: width * 0.5,
                          height: 60,
                          context: context,
                          onpress: () {
                            if (nameController.text == '' ||
                                emailController.text == '') {
                              showToast(
                                text: 'Fill the empty fields, please',
                                status: toastStates.WARNING,
                              );
                            } else if (nameController.text ==
                                    userModeldata.name &&
                                emailController.text == userModeldata.email &&
                                phoneController.text == userModeldata.uId) {
                              Fluttertoast.showToast(
                                  msg: 'you did not updated any information',
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 5,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              MainCubit.get(context).updateUser(
                                  editedName: nameController.text,
                                  editedEmail: emailController.text,
                                  editedPhone: phoneController.text, context: context,);
                              
                            }
                          })
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
