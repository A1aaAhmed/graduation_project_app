import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_app/modules/Ticket/cubit/states.dart';


class TicketCubit extends Cubit<TicketsStates>{
  TicketCubit():super (TicketsInitialState());
  static TicketCubit get(context)=>BlocProvider.of(context);

  List allTickets=[];
  List previousTickets=[];
  List availableTickets=[];
  void getAllTickets(){
    ///need uid here
    FirebaseFirestore.instance.collection("users").doc("rH56bEn5CaTfTjLo3fOJ7emfyfw1").collection('tickets').get().then((value) {

    });

  }


}

