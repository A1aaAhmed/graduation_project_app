import 'package:graduation_project_app/models/user.dart';

abstract class loginStates {}
class passIsVisibleState extends loginStates{}
class loginInitialState extends loginStates {}
class loginLoadinglState extends loginStates {}
class loginSucessState extends loginStates {
  final String uId;
  loginSucessState(this.uId);
}
class loginErrorState extends loginStates {
  final String error;
  loginErrorState(this.error);
}
