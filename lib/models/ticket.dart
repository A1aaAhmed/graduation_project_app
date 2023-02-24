class TicketModel{
   String from='from';
   String to='to';
   String duration='dur';
   String seats='seats';
   String train='train';
   String price='price';
   DateTime date=DateTime.now();
   TicketModel({
      required this.from,
      required this.to,
      required this.duration,
      required this.train,
      required this.price,
      required this.date,
      required this.seats
   });

   TicketModel.fromJason(Map<String , dynamic>json){
      from=json['from'];
      to=json['to'];
      seats=json['seats'];
      duration=json['duration'];
      price=json['price'];
      train=json['train'];
      date=DateTime.parse(json['date']);
   }
   Map<String , dynamic>toMap(){
      return
         {
            "from":from,
            "to":to,
            "duration":duration,
            "seats":seats,
            "price":price,
            "train":train,
            "date":date.toString(),
         };

}}