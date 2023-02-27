import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_project_app/models/ticket.dart';

class UserModel{
  String ? id;
  String? name;
  String?email;
  String ?phone;
  String ?image;
  //String token;
  //TicketModel ?tickets;
  UserModel({
    this.name,
    this.email,
    this.phone,
    this.image,
    //this.token,
    this.id,
    //this.tickets
  });

  UserModel.fromJason(Map<String , dynamic>json){
    id=json['id'];
    name=json['name'];
    phone=json['phone'];
    image=json['image'];
    email=json['email'];
  }
  Map<String , dynamic>toMap(){
    return
      {
        "id":id,
        "name":name,
        "phone":phone,
        "image":image,
        "email":email,
      };
  }
  static void createUser({
    required String name,
    required String email,
    required String phone,
    required String image,
    required String uId,
  })
  {
    UserModel user =UserModel(
      email: email,
      id: uId,
      image: image,
      name: name,
      phone: phone,
    );
    CollectionReference usersCollection = FirebaseFirestore.instance.collection("users");
    usersCollection.doc(uId).set(user.toMap());
  }
  static void addTicket({
    required TicketModel ticket,
    required String uId,
  })
  async{
    final snapshot = await FirebaseFirestore.instance.collection('tickets').get();
    if ( snapshot.size == 0 ) {
      FirebaseFirestore.instance.collection("users").doc(uId).collection('tickets').add(ticket.toMap());
    }
    else {
      CollectionReference usersCollection = FirebaseFirestore.instance.collection("users");
      usersCollection.doc(uId).collection('tickets').add(ticket.toMap());
    }

  }

}