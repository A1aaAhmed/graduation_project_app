//TextEditingController from = TextEditingController();
//TextEditingController to = TextEditingController();
//TextEditingController depart = TextEditingController();
import 'package:graduation_project_app/modules/Ticket/timeFuns.dart';
import 'package:graduation_project_app/modules/live_location/Cubit/cubit.dart';
import 'package:graduation_project_app/network/local/shared_pref.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../modules/seats_screen/widgets/classesmodel.dart';
var uId= casheHelper?.getData(key: 'uId') ;
String from='';
String to='';
String depart='';
int travellers = 1;
var trian_location_long = 31.233334;
var trian_location_lat = 30.033333;
String googleAPiKey = "AIzaSyBSob1uooRKAkU1SzUjXrxsAeVj-u_OcTc";
/////////////////////////////////////////////////////////////
///add uid of the current user here yaaaaaaaaaaaaaaaaaaa maaaaaaaaaaaaaaaahaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
//var uId="rH56bEn5CaTfTjLo3fOJ7emfyfw1";
List availableTicket =[];
DateTime dateTicket=DateTime.now();
String station="";
String Train="";
///changed later

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
MapsCubit? maps_cubic;

LatLng trainLonLat=LatLng(trian_location_lat, trian_location_long);
String realOpt='';
String userOpt='';