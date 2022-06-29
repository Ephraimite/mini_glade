
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier{

  final DateTime _dateTime = DateTime.now();
  DateTime get dateTime => _dateTime;
}
extension DateTimeExtension on DateTime {
  String get greetings {
    var hour = this.hour;
    if (hour < 12) {
      return 'Good Morning,';
    }
    if (hour < 17) {
      return 'Good Afternoon,';
    }
    return 'Good Evening,';
  }
}