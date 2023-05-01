abstract class googleStates {}

class googleInitialStates extends googleStates {}

class googleLoadingStates extends googleStates {}
class googleSucessStates extends googleStates {}


abstract class AuthStates {}
class createGoogleUserSucessState extends AuthStates{
  final String uId;
  createGoogleUserSucessState(this.uId);
}

class createGoogleUserErrorState extends AuthStates {
  final String error;
  createGoogleUserErrorState(this.error);
}

class AuthInitialStates extends AuthStates {}

class VerificationSuccessState extends AuthStates {}

 class VerificationErrorState extends AuthStates {
  final String error;

  VerificationErrorState(this.error);

}

class CodeSentState extends AuthStates {}

class TimeoutState extends AuthStates {}

class LoginSuccessState extends AuthStates {}

class LoginErrorState extends AuthStates {
  final String error;
  LoginErrorState(this.error);
}
