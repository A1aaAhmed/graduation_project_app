import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/ticket.dart';
import 'package:graduation_project_app/modules/Ticket/cubit/states.dart';
import 'package:graduation_project_app/modules/Ticket/timeFuns.dart';
import 'package:graduation_project_app/shared/variables.dart';
class TicketCubit extends Cubit<TicketsStates>{
  TicketCubit():super (TicketsInitialState());
  static TicketCubit get(context)=>BlocProvider.of(context);
  List previousTickets=[];
  List availableTickets=[];
  Future<void> getAllTickets()async{
    emit(LoadingState());
    // print("innnnnnnnnnnnnnnnnnnnn");
    ///need uid here
    FirebaseFirestore.instance.collection("users").doc("rH56bEn5CaTfTjLo3fOJ7emfyfw1").collection('tickets').get()
        .then((value) {
          value.docs.forEach((element) {
            if (expired(TicketModel.fromJason(element.data()).date)){
              previousTickets.add(TicketModel.fromJason(element.data()));
            }
            else {
              availableTickets.add(TicketModel.fromJason(element.data()));
            }
          });
          previousTickets.sort((a, b) =>  b.date.compareTo(a.date));
          availableTickets.sort((a, b) => a.date.compareTo(b.date));
          availableTicket=availableTickets;
        if (availableTickets.isNotEmpty)station=availableTickets[0].from;
        // print(previousTickets);
        // print(availableTickets);
        // print(availableTickets[0].date);
        emit(GetAllTicketsState());
    });

  }




}

