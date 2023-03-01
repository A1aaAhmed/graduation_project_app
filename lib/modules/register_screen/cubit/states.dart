
abstract class registerStates {}
class passIsVisibleState extends registerStates{}
class registerInitialState extends registerStates {}
class registerLoadinglState extends registerStates {}
class registerSucessState extends registerStates {

}
class registerErrorState extends registerStates {
  final String error;
  registerErrorState(this.error);
}
class createUserSucessState extends registerStates {
  final String uId;
  createUserSucessState(this.uId);
}
class createUserErrorState extends registerStates {
  final String error;
  createUserErrorState(this.error);
}