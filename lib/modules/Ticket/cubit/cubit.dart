import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/models/ticket.dart';
import 'package:graduation_project_app/modules/Ticket/cubit/states.dart';
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
          previousTickets= List.of(previousTickets.reversed);
          availableTickets= List.of(availableTickets.reversed);

        // print(previousTickets);
        // print(availableTickets);
        // print(availableTickets[0].date);
        emit(GetAllTicketsState());
    });

  }
 static bool expired (DateTime date){
    DateTime now=DateTime.now();
    return date.year < now.year ||
        date.year == now.year && date.month < now.month ||
        date.year == now.year &&
            date.month == now.month &&
            date.day < now.day ||
        date.year == now.year &&
            date.month == now.month &&
            date.day == now.day &&
            date.hour < now.hour ||
        date.year == now.year &&
            date.month == now.month &&
            date.day == now.day &&
            date.hour == now.hour &&
            date.minute < now.minute;
  }



}

