abstract class MainStates {}

class MainIntialState extends MainStates {}

class ChangeNavBarState extends MainStates {}
class profileInitialState extends MainStates {}
class profilePickedImageProfileSucessState extends MainStates{}
class profilePickedImageProfileErrortate extends MainStates{}
class profileSetNameState extends MainStates{}
class profileSetEmailState extends MainStates{}
class profileSetPhoneState extends MainStates{}
class getUserLoadingState extends MainStates{}
class getUserSucessState extends MainStates{}
class getUserErrorState extends MainStates{
  final  String error;
  getUserErrorState(this.error);}
class logOutLoadingState extends MainStates{}
class logOutSucessState extends MainStates{}
class logOutErrorState extends MainStates{
  final String error;
  logOutErrorState(this.error);
}
class uploadProfileSucessState extends MainStates{}
class uploadProfileErrorState extends MainStates{
  final String error;
  uploadProfileErrorState(this.error);
}
class updateUserErrorState extends MainStates{
  final String error;
  updateUserErrorState(this.error);
}
class updateUserLoadingState extends MainStates{}

class ResetSeatsSuccessState extends MainStates{}

class ResetSeatsErrorState extends MainStates {
  final String error;
  ResetSeatsErrorState(this.error);
}

class CheckExpiredDateErrorState extends MainStates {
  final String error;
  CheckExpiredDateErrorState(this.error);
}
class CheckExpiredDateSuccesState extends MainStates {}
class DeleteFieldState extends MainStates {}
class AddFieldState extends MainStates {}
class DeleteFieldErrorState extends MainStates {
  final String error;
  DeleteFieldErrorState(this.error);}

class DeleteFieldState extends MainStates{}
class AddFieldState extends MainStates{}
class DeleteFieldErrorState extends MainStates{final error;

  DeleteFieldErrorState(this.error);
}