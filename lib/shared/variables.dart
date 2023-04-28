//TextEditingController from = TextEditingController();
//TextEditingController to = TextEditingController();
//TextEditingController depart = TextEditingController();
import 'package:graduation_project_app/network/local/shared_pref.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
var uId= casheHelper?.getData(key: 'uId') ;
String from='';
String to='';
String depart='';
int travellers = 1;
// List<Map> db = [
//   {
//     'from': 'korea',
//     'to': 'Aswan',
//     'date': '2022-12-14 23:17:54.652181',
//     'price': '250',
//     'trin_number': 'A',
//     'dur': '1hr-50min',
//     'seat':
//         'A1,A2,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,kkkkkkkkkkkkkkkkkkk'
//   },
//   {
//     'from': 'Alexanddriaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
//     'to': 'Aswan',
//     'date': '2025-01-02 07:12:50.000',
//     'price': '250',
//     'trin_number': 'A',
//     'dur': '1hr-50min',
//     'seat': 'A1,A2'
//   },
//   {
//     'from': 'Alexanddria',
//     'to': 'Aswannnnnnnnnnnnnnnnnnnnnnnnn',
//     'date': '2020-01-02 07:12:50.000',
//     'price': '250',
//     'trin_number': 'A',
//     'dur': '1hr-50min',
//     'seat': 'A1,A2'
//   },
//   {
//     'from': 'Alexanddria',
//     'to': 'Aswan',
//     'date': '2020-01-02 07:12:50.000',
//     'price': '250',
//     'trin_number': 'Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
//     'dur': '1hr-50min',
//     'seat': 'A1,A2'
//   },
//   {
//     'from': 'Alexanddria',
//     'to': 'Aswan',
//     'date': '2020-01-02 07:12:50.000',
//     'price': '250',
//     'trin_number': 'A',
//     'dur': '1hr-50min',
//     'trin_number': 'A1,A2'
//   },
//   {
//     'from': 'Alexanddria',
//     'to': 'Aswan',
//     'date': '2020-01-02 07:12:50.000',
//     'price': '250000000000000000000000000000000000',
//     'gate': 'A',
//     'dur': '1hr-50min',
//     'seat': 'A1,A2'
//   },
//   {
//     'from': 'Alexanddria',
//     'to': 'Aswan',
//     'date': '2020-01-02 07:12:50.000',
//     'price': '250',
//     'trin_number': 'A',
//     'dur': '1hr-50min',
//     'seat': 'A1,A2'
//   },
//   {
//     'from': 'Alexanddria',
//     'to': 'Aswan',
//     'date': '2000-01-02 07:12:50.000',
//     'price': '250',
//     'trin_number': 'A',
//     'dur': '1hr-50min',
//     'seat': 'A1,A2'
//   },
//   {
//     'from': 'Alexanddria',
//     'to': 'Aswan',
//     'date': '2000-01-02 07:12:50.000',
//     'price': '250',
//     'trin_number': 'A',
//     'dur': '1hr-50min',
//     'seat': 'A1,A2'
//   },
//   {
//     'from': 'Alexanddria',
//     'to': 'Aswan',
//     'date': '2000-01-02 07:12:50.000',
//     'price': '250',
//     'trin_number': 'A',
//     'dur': '1hr-50min',
//     'seat': 'A1,A2'
//   },
//   {
//     'from': 'Alexanddria',
//     'to': 'Aswan',
//     'date': '2000-01-02 07:12:50.000',
//     'price': '250',
//     'trin_number': 'A',
//     'dur': '1hr-50min',
//     'seat': 'A1,A2'
//   },
//   {'from': 'korea','to':'Aswan' ,'date':'2022-12-14 23:17:54.652181','price':'250','trin_number':'A','dur':'1hr-50min','seat':'A1,A2,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,k,kkkkkkkkkkkkkkkkkkk'},
//   {'from': 'Alexanddriaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','to':'Aswan' ,'date':'2025-01-02 07:12:50.000','price':'250','trin_number':'A','dur':'1hr-50min','seat':'A1,A2'},
//   {'from': 'Alexanddria','to':'Aswannnnnnnnnnnnnnnnnnnnnnnnn' ,'date':'2020-01-02 07:12:50.000','price':'250','trin_number':'A','dur':'1hr-50min','seat':'A1,A2'},
//   {'from': 'Alexanddria','to':'Aswan' ,'date':'2020-01-02 07:12:50.000','price':'250','trin_number':'Aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','dur':'1hr-50min','seat':'A1,A2'},
//   {'from': 'Alexanddria','to':'Aswan' ,'date':'2020-01-02 07:12:50.000','price':'250','trin_number':'A','dur':'1hr-50min','seat':'A1,A2'},
//   {'from': 'Alexanddria','to':'Aswan' ,'date':'2020-01-02 07:12:50.000','price':'250000000000000000000000000000000000','trin_number':'A','dur':'1hr-50min','seat':'A1,A2'},
//   {'from': 'Alexanddria','to':'Aswan' ,'date':'2020-01-02 07:12:50.000','price':'250','trin_number':'A','dur':'1hr-50min','seat':'A1,A2'},
//   {'from': 'Alexanddria','to':'Aswan' ,'date':'2000-01-02 07:12:50.000','price':'250','trin_number':'A','dur':'1hr-50min','seat':'A1,A2'},
//   {'from': 'Alexanddria','to':'Aswan' ,'date':'2000-01-02 07:12:50.000','price':'250','trin_number':'A','dur':'1hr-50min','seat':'A1,A2'},
//   {'from': 'Alexanddria','to':'Aswan' ,'date':'2000-01-02 07:12:50.000','price':'250','trin_number':'A','dur':'1hr-50min','seat':'A1,A2'},
//   {'from': 'Alexanddria','to':'Aswan' ,'date':'2000-01-02 07:12:50.000','price':'250','trin_number':'A','dur':'1hr-50min','seat':'A1,A2'},
// ];
var trian_location_long = 31.233334;
var trian_location_lat = 30.033333;
String googleAPiKey = "AIzaSyBSob1uooRKAkU1SzUjXrxsAeVj-u_OcTc";
/////////////////////////////////////////////////////////////
///add uid of the current user here yaaaaaaaaaaaaaaaaaaa maaaaaaaaaaaaaaaahaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
//var uId="rH56bEn5CaTfTjLo3fOJ7emfyfw1";
List availableTicket =[];
DateTime dateTicket=DateTime.now();
String station="";
///changed later
LatLng trainLonLat = LatLng(trian_location_lat, trian_location_long);

//seatsScreen constants
var numberOfSeats = 0;//in seats screen
num amountToBePayed = 0;
int noOfChoosenSeats = 1; //in home screen 
List<String> selectedSeats = [];
List<String> gates = [];
List<TrainClassesModel> classType = [];
List<dynamic> allSeats = [];
String seatsId = '';
String fieldName = newDateTime(depart, "23:59:59").toString().split(" ").first;
String day =
    DateFormat('EEEE').format(DateTime.parse(depart)).substring(0,3);
