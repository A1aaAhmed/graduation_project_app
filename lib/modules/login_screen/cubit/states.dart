abstract class loginStates {}
class passIsVisibleState extends loginStates{}
class loginInitialState extends loginStates {}
class loginLoadinglState extends loginStates {}
class loginSucessState extends loginStates {
  //final loginModel model;
  //loginSucessState(this.model);
}
class loginErrorState extends loginStates {
  final String error;
  loginErrorState(this.error);
}