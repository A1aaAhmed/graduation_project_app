abstract class googleStates {}
class googleInitialStates extends googleStates{}
class googleLoadingStates extends googleStates{}
class createGoogleUserSucessState extends googleStates{
  final String uId;
  createGoogleUserSucessState(this.uId);
}
class createGoogleUserErrorState extends googleStates{
  final String error;
  createGoogleUserErrorState(this.error);
}