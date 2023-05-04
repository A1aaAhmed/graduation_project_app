abstract class SeatsScreenStates{}
class SeatsScreenInitialState extends SeatsScreenStates{}
class RemoveSeatsState extends SeatsScreenStates{}
class ChangeSeatsState extends SeatsScreenStates{}

class GetSeatsSuccessState extends SeatsScreenStates{}
class GetSeatsErrorState extends SeatsScreenStates{
  final String error;
  GetSeatsErrorState(this.error);
  
}
class UpdateSeatsSuccessState extends SeatsScreenStates{}
class UpdateSeatsErrorState extends SeatsScreenStates{
  final String error;
  UpdateSeatsErrorState(this.error);
  
}

class CheckState extends SeatsScreenStates{}

