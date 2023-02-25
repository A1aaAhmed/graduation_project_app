import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/Profile/cubit/states.dart';
import 'package:image_picker/image_picker.dart';

class profileCubit extends Cubit<profileStates>{
  profileCubit():super(profileInitialState());

  static profileCubit get(context)=>BlocProvider.of(context);


  File? profileImage;
  Future<void> getImage()async{

    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
     profileImage = File(image.path);
     emit(profilePickedImageProfileSucessState());
    }
    else {
      print('no image selected');
      emit(profilePickedImageProfileErrortate());
    }

  }
  //////////////////////////////////////////////
  var nameController =TextEditingController();
  String name='';
  Future<String?> submitName(BuildContext context) =>
      showDialog<String>(
          context: context,
          builder: (context) =>
              AlertDialog(
                title: Text('your name'),
                content: TextField(
                  decoration: InputDecoration(hintText: 'enter your name'),
                  controller:  nameController,
                ),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.of(context).pop(nameController.text);
                  }, child: Text('submit'))
                ],
              ));
  void setName({required String name}){
      this.name = name;
      emit(profileSetNameState());
  }
  /////////////////////////////////////////////
  var emailController =TextEditingController();
  String email='';
  Future<String?> submitEmail(BuildContext context) =>
      showDialog<String>(
          context: context,
          builder: (context) =>
              AlertDialog(
                title: Text('your email'),
                content: TextField(
                  decoration: InputDecoration(hintText: 'enter your email'),
                  controller:  emailController,
                ),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.of(context).pop(emailController.text);
                  }, child: Text('submit'))
                ],
              ));
  void setEmail({required String email}){
    this.email = email;
    emit(profileSetEmailState());
  }
  ////////////////////////////////////////////////////
  var phoneController =TextEditingController();
  String phone='';
  Future<String?> submitPhone(BuildContext context) =>
      showDialog<String>(
          context: context,
          builder: (context) =>
              AlertDialog(
                title: Text('your phone'),
                content: TextField(
                  decoration: InputDecoration(hintText: 'enter your phone'),
                  controller:  phoneController,
                ),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.of(context).pop(phoneController.text);
                  }, child: Text('submit'))
                ],
              ));
  void setPhone({required String phone}){
    this.phone = phone;
    emit(profileSetPhoneState());
  }
}