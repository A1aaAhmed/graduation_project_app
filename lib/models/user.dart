import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_project_app/models/ticket.dart';

class UserModel{

  String? name;
  String?email;

   String ?image;
   String? uId;
   String?bill;
  //TicketModel ?tickets;
  UserModel({
   this.name,
   this.email,

   this.image,
    this.bill,
   //this.token,
   this.uId,
   //this.tickets
  });

  UserModel.fromJason(Map<String , dynamic>json){
    uId=json['uId'];
    name=json['name'];
    image=json['image'];
    email=json['email'];
    bill=json['bill'];
  }
 Map<String , dynamic>toMap(){
return
  {
  "uId":uId,
  "name":name,
  "image":image,
  "email":email,
    "bill":bill
  };
}

  static void addTicket({
    required TicketModel ticket,
    required String uId,
  })
  async{
    final snapshot = await FirebaseFirestore.instance.collection('users')
        .doc(uId.substring(0, 3))
        .collection('numbers')
        .doc(uId).collection('tickets').get();
    if ( snapshot.size == 0 ) {
      FirebaseFirestore.instance.collection("users")
        .doc(uId.substring(0, 3))
        .collection('numbers')
        .doc(uId).collection('tickets').add(ticket.toMap());
    }
    else {
      CollectionReference usersCollection = FirebaseFirestore.instance.collection("users");
      usersCollection.doc(uId.substring(0, 3))
        .collection('numbers')
        .doc(uId).collection('tickets').add(ticket.toMap());
    }

  }

  static Future<bool> searchNumber({
    required String number,
  })
  async{
    try {
      String start=number.substring(0,3);
      var snapshot= await FirebaseFirestore.instance
          .collection("users")
          .doc(start)
          .collection('numbers').doc(number).get();
        return snapshot.exists;
    } catch (e) {
      // If any error
      return false;
    }
    }
  }

