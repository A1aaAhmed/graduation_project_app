abstract class TicketsStates {}

class TicketsInitialState extends TicketsStates {}

class LoadingState extends TicketsStates {}

class GetAllTicketsState extends TicketsStates {}

class ChangeTicketsScreensState extends TicketsStates {}

class ClearExpiredTicketsState extends TicketsStates {}

class CancelTicketsState extends TicketsStates {}

class DeleteExpiredTicketsState extends TicketsStates {}

class AddTicketsState extends TicketsStates {}


class CancelTicketErrorState extends TicketsStates {
  final error;

  CancelTicketErrorState(this.error);
}
