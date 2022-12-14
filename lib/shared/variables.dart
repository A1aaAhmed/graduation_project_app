import 'package:flutter/material.dart';

TextEditingController from = TextEditingController();
TextEditingController to = TextEditingController();
TextEditingController depart = TextEditingController();
int travellers = 1;
List<Map> db = [
  {'from': 'korea','to':'Aswan' ,'date':'2022-12-14 23:17:54.652181','price':'250','gate':'A','dur':'1hr-50min','seat':'A1,A2'},
  {'from': 'Alexanddria','to':'Aswan' ,'date':'2025-01-02 07:12:50.000','price':'250','gate':'A','dur':'1hr-50min','seat':'A1,A2'},
  {'from': 'Alexanddria','to':'Aswan' ,'date':'2020-01-02 07:12:50.000','price':'250','gate':'A','dur':'1hr-50min','seat':'A1,A2'},
  {'from': 'Alexanddria','to':'Aswan' ,'date':'2020-01-02 07:12:50.000','price':'250','gate':'A','dur':'1hr-50min','seat':'A1,A2'},
  {'from': 'Alexanddria','to':'Aswan' ,'date':'2020-01-02 07:12:50.000','price':'250','gate':'A','dur':'1hr-50min','seat':'A1,A2'},
  {'from': 'Alexanddria','to':'Aswan' ,'date':'2020-01-02 07:12:50.000','price':'250','gate':'A','dur':'1hr-50min','seat':'A1,A2'},
  {'from': 'Alexanddria','to':'Aswan' ,'date':'2020-01-02 07:12:50.000','price':'250','gate':'A','dur':'1hr-50min','seat':'A1,A2'},
  {'from': 'Alexanddria','to':'Aswan' ,'date':'2000-01-02 07:12:50.000','price':'250','gate':'A','dur':'1hr-50min','seat':'A1,A2'},
  {'from': 'Alexanddria','to':'Aswan' ,'date':'2000-01-02 07:12:50.000','price':'250','gate':'A','dur':'1hr-50min','seat':'A1,A2'},
  {'from': 'Alexanddria','to':'Aswan' ,'date':'2000-01-02 07:12:50.000','price':'250','gate':'A','dur':'1hr-50min','seat':'A1,A2'},
  {'from': 'Alexanddria','to':'Aswan' ,'date':'2000-01-02 07:12:50.000','price':'250','gate':'A','dur':'1hr-50min','seat':'A1,A2'},
];