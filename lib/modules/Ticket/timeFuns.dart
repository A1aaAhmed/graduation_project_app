import 'package:graduation_project_app/shared/variables.dart';
import 'package:intl/intl.dart';

bool expired (DateTime date){
DateTime now=DateTime.now();
return date.year < now.year ||
date.year == now.year && date.month < now.month ||
date.year == now.year &&
date.month == now.month &&
date.day < now.day ||
date.year == now.year &&
date.month == now.month &&
date.day == now.day &&
date.hour < now.hour ||
date.year == now.year &&
date.month == now.month &&
date.day == now.day &&
date.hour == now.hour &&
date.minute < now.minute;
}
bool started(DateTime date){
  DateTime now=DateTime.now();
  return date.isBefore(now);
}
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
  dateTicket=format.parse(date);
  return format.parse(date);
}
bool isToday(date){
  DateTime now=DateTime.now();
  return date.day == now.day &&
      date.year == now.year &&
      date.month == now.month;
}
String newDateTime(
  String datewitholdtime,
  String newtime,
) {
  String newdate = datewitholdtime.substring(0, 10);
// print("date first ------------------------------------------------");
// print(date);
// print(time);
  newdate = "$newdate $newtime";
  return newdate;
}
