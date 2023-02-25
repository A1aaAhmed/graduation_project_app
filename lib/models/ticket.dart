import 'package:flutter/material.dart';

class TicketModel {
  String from = 'from';
  String to = 'to';
  String seats = 'seats';
  String train = 'train';
  String price = 'price';
  DateTime date = DateTime.now();
  String startTime = 'startTime';
  String trainNUM = 'trainNUM';

  TicketModel({
    required this.from,
    required this.to,
    required this.train,
    required this.price,
    required this.date,
    required this.seats,
    required this.startTime,
    required this.trainNUM,
  });

  TicketModel.fromJason(Map<String, dynamic> json) {
    from = json['from'];
    to = json['to'];
    seats = json['seats'];
    price = json['price'];
    train = json['train'];
    date = DateTime.parse(json['date']);
    startTime = json['startTime'];
    trainNUM = json['trainNUM'];
  }
  Map<String, dynamic> toMap() {
    return {
      "from": from,
      "to": to,
      "seats": seats,
      "price": price,
      "train": train,
      "date": date.toString(),
      "startTime": startTime,
      'trainNUM':trainNUM,
    };
  }
}
