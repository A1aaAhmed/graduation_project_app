import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/layout/cubit/cubit.dart';
import 'package:graduation_project_app/layout/cubit/states.dart';
import 'package:graduation_project_app/modules/Profile/profile_screen.dart';
import 'package:graduation_project_app/shared/components/components.dart';
import 'package:graduation_project_app/shared/style/colors.dart';
class editProfileScreen extends StatelessWidget {
  const editProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var nameController=TextEditingController();
    var emailController=TextEditingController();
    var phoneController=TextEditingController();
    return BlocConsumer<MainCubit,MainStates>(
      listener: (context,state){
       // MainCubit.get(context).profileImage;
      },
      builder: (context,state){
        var userModeldata = MainCubit.model;
        var editedProfileImage= MainCubit.get(context).profileImage;
        nameController.text= userModeldata!.name!;
        emailController.text= userModeldata!.email!;
        phoneController.text= userModeldata!.phone!;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios)),
            title: Text('edit your profile', style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colortheme.lightGray,
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
            ),
            actions: [
              TextButton(onPressed: ()async{
                MainCubit.get(context).updateUser(editedName: nameController.text, editedEmail: emailController.text, editedPhone: phoneController.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => ProfileScreen()),
                        ));

              }, child: Text('Update',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colortheme.lightGray,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),)),
            ],
          ),
          body:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(state is updateUserLoadingState)
                LinearProgressIndicator(),
                if(state is updateUserLoadingState)
                SizedBox(height: 5,),
                Container(
                  height: (height * 0.24)+60,
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
                              image:const DecorationImage(
                                repeat: ImageRepeat.noRepeat,
                                image: AssetImage('assets/images/train.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(width * .1),
                                bottomRight: Radius.circular(width * .1),)
                          ),
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
                              backgroundImage: editedProfileImage == null ? NetworkImage('${userModeldata!.image!}') as ImageProvider:FileImage(editedProfileImage),
                            ),
                          ),

                          CircleAvatar(child:
                          Center(
                            child: IconButton(
                              onPressed: (){
                                 MainCubit.get(context).getImage();
                              },
                              icon:Icon(Icons.add_a_photo,size: 24,), ),
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                if(MainCubit.get(context).profileImage != null)
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: defultButton(background: colortheme.lightPurple, function: ()async{
                    MainCubit.get(context).uploadImage(name: nameController.text, email: emailController.text, phone: phoneController.text);
Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => ProfileScreen()),
                              ));

                  }, text: 'Update Profile'),
                ),
                if(state is updateUserLoadingState)
                  SizedBox(height: 5,),
                if(state is updateUserLoadingState)
                  LinearProgressIndicator(),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: defualtForm(
                    prefix: Icons.person,
                    controller: nameController,
                    inputType: TextInputType.name,
                    validator: 'name must not be empty',
                    lable: 'enter your name',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: defualtForm(
                    prefix: Icons.email,
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                    validator: 'email must not be empty',
                    lable: 'enter your email',

                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: defualtForm(
                    prefix: Icons.phone,
                    controller: phoneController,
                    inputType: TextInputType.phone,
                    validator: 'phone must not be empty',
                    lable: 'enter your phone',

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
