
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation_project_app/modules/Profile/cubit/cubit.dart';
import 'package:graduation_project_app/modules/Profile/cubit/states.dart';
import 'package:graduation_project_app/modules/social/welcome_screen.dart';
import 'package:graduation_project_app/shared/components/appBar.dart';
import 'package:graduation_project_app/shared/style/colors.dart';


class ProfileScreen extends StatelessWidget {

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return

      BlocConsumer<profileCubit,profileStates>(
       listener: (context,state){
         profileCubit.get(context).profileImage;

       },
        builder: (context,state){
         return Scaffold(
             appBar: bar(context: context, text: 'Profile', morelist: false),
             body: SingleChildScrollView(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
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
                                 backgroundImage: profileCubit.get(context).profileImage == null ? const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCx4ccalfApSkEYuRVPPOaHuBArgEUczsJKLsoofXozOerx-A-0rtEalHhLqfHuW3mi1A&usqp=CAU') as ImageProvider:FileImage((profileCubit.get(context).profileImage)!),
                               ),
                             ),
                             CircleAvatar(child:
                             Center(
                               child: IconButton(
                                 onPressed: (){
                                profileCubit.get(context).getImage();
                                 },
                                 icon:const Icon(Icons.add_a_photo,size: 24,), ),
                             )),
                           ],
                         ),
                       ],
                     ),
                   ),
                   const SizedBox(
                     height: 12,
                   ),
                   Padding(
                     padding: const EdgeInsets.only(right: 10,left: 10),
                     child: Row(
                       children: [
                         const Icon(Icons.person),
                         const SizedBox(width: 7,),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             const Text('name:',style: TextStyle(color:Colors.black),),
                             Text(profileCubit.get(context).name==''?'xxxx xxxx':profileCubit.get(context).name,style: const TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.bold,
                               fontSize: 16,
                             )),
                           ],
                         ),
                         const Spacer(),
                         IconButton(onPressed: ()async{
                           final nam = await profileCubit.get(context).submitName(context);
                          if(nam == null || nam.isEmpty){
                            print('name is empty');
                          }
                          else{
                            print("got name");
                            profileCubit.get(context).setName(name: nam);
                          }
                         },
                         icon: const Icon(Icons.edit))
                       ],
                     ),
                   ),
                   const SizedBox(
                     height: 21,
                   ),
                   Padding(
                     padding: const EdgeInsets.only(right: 10,left: 10),
                     child: Row(
                       children: [
                         const Icon(Icons.email),
                         const SizedBox(width: 7,),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             const Text('Email',style: TextStyle(color: Colors.black),),
                             Text(profileCubit.get(context).email==''?'xxxx@gmail.com':profileCubit.get(context).email,style: const TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.bold,
                               fontSize: 16,
                             ), ),
                           ],
                         ),
                         const Spacer(),
                         IconButton(onPressed: ()async{
                           final email =await profileCubit.get(context).submitEmail(context);
                           if(email == null || email.isEmpty){
                             print('email is empty');
                           }
                           else
                             {
                               print('got email');
                               profileCubit.get(context).setEmail(email: email);
                             }
                         }, icon: const Icon(Icons.edit)),
                       ],
                     ),
                   ),
                   const SizedBox(
                     height: 21,
                   ),
                   Padding(
                     padding: const EdgeInsets.only(right: 10,left: 10),
                     child: Row(
                       children: [
                         const Icon(Icons.phone_android),
                         const SizedBox(width: 7,),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             const Text('phone',style: TextStyle(color: Colors.black),),
                             Text(profileCubit.get(context).phone == '' ?'01xxxxxxxx':profileCubit.get(context).phone,style: const TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.bold,
                               fontSize: 16,
                             ), ),
                           ],
                         ),
                         const Spacer(),
                         IconButton(onPressed: ()async{
                           final phone =await profileCubit.get(context).submitPhone(context);
                           if(phone == null || phone.isEmpty){
                             print('phone is empty');
                           }
                           else
                           {
                             print('got phone');
                             profileCubit.get(context).setPhone(phone: phone);
                           }
                         }, icon: const Icon(Icons.edit,)),
                       ],
                     ),
                   ),
                   const SizedBox(
                     height: 21,
                   ),
                   Padding(
                     padding: const EdgeInsets.only(right: 10,),
                     child: Row(
                       children: [
                         TextButton.icon(onPressed: (){},
                             icon: const Icon(Icons.archive_sharp,color: colortheme.lightPurple,),
                             label: const Text('Previous Tickets',style: TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.bold,
                               fontSize: 16,
                             ),)),
                         const Spacer(),
                         IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_circle_right_outlined)),
                       ],
                     ),
                   ),
                   const SizedBox(height: 27,),
                   TextButton.icon(
                     onPressed: ()async{
                       await GoogleSignIn().signOut();
                       FirebaseAuth.instance.signOut();
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) =>  const welcomeScreen()),);
                     },
                     icon: const Icon(Icons.logout_outlined,color: Colors.red),
                     label: const Text(
                       'SIGN OUT',
                       style: TextStyle(
                         color: Colors.red,
                         fontWeight: FontWeight.bold,

                       ),
                     ),)
                 ],
               ),
             )
         );

        },

    );
  }


}

