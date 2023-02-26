import 'package:intl/intl.dart';

DateTime toDateTime (String input ,String time,){
String date=input.substring(0, 10);
// print("date first ------------------------------------------------");
// print(date);
// print(time);
date="$date $time";
DateFormat format = DateFormat("yyyy-MM-dd hh:mm a");
date = date.replaceFirst(' pm', ' PM').replaceFirst(' am', ' AM');
// print("final as string  ------------------------------------------------");
// print(date);
// print("final as timedate  ------------------------------------------------");
// print(format.parse(date));
return format.parse(date);
}