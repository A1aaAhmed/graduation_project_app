abstract class HomeScreenStates {}

class HomeScreenIntialState extends HomeScreenStates {}

class GetTrainsSuccessState extends HomeScreenStates {}

class GetTrainsErrorState extends HomeScreenStates {
  String error;
  GetTrainsErrorState(this.error);
}

class GetTrainsLoadingState extends HomeScreenStates {}



class SearchTrainsLoadingState extends HomeScreenStates {}

class SearchTrainsSuccessState extends HomeScreenStates {}
