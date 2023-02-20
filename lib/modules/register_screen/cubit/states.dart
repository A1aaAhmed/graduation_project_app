
abstract class registerStates {}
class passIsVisibleState extends registerStates{}
class registerInitialState extends registerStates {}
class registerLoadinglState extends registerStates {}
class registerSucessState extends registerStates {
  //final loginModel model;
  //registerSucessState(this.model);
}
class registerErrorState extends registerStates {
  final String error;
  registerErrorState(this.error);
}