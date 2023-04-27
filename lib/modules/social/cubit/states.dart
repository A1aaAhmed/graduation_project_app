abstract class googleStates {}

class googleInitialStates extends googleStates {}

class googleLoadingStates extends googleStates {}

class createGoogleUserSucessState extends googleStates {
  final String uId;
  createGoogleUserSucessState(this.uId);
}

class createGoogleUserErrorState extends googleStates {
  final String error;
  createGoogleUserErrorState(this.error);
}

abstract class AuthStates {}

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
