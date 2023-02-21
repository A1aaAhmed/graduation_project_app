class loginModel {
  late bool status;
  late String message;
  userData ?data;

  loginModel.fromjson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? userData.fromJason(json['data']) : null;
  }
}
class userData{
  int ? id;
  String? name;
  String?email;
  String ?phone;
  String ?image;
  late String token;
  //userData({
  //  this.name,
  // this.email,
  // this.phone,
  // this.image,
  // this.token,
  // this.id,
  //});
  //named constractor
  userData.fromJason(Map<String , dynamic>json){
    id=json['id'];
    name=json['name'];
    phone=json['phone'];
    image=json['image'];
    token=json['token'];
  }
}

