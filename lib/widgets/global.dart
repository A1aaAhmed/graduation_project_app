import 'package:graduation_project_app/modules/Ticket/timeFuns.dart';
import 'package:graduation_project_app/modules/live_location/Cubit/cubit.dart';
import 'package:graduation_project_app/shared/variables.dart';

var numberOfSeats = 0;
var amountToBePayed = 0;
int seats = 1;
List<String> selectedSeats = [];
List<String> gates = [];
List<dynamic> allSeats = [];
String seatsId = '';
String fieldName =
        newDateTime(depart, "23:59:59");
MapsCubit? maps_cubic;