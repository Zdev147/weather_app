import 'package:intl/intl.dart';


extension DateTimeExtension on DateTime {
  String format() {
    return DateFormat('dd-MM-yyyy').format(this);
  }

  String formatTime() {
    return DateFormat('hh:mm a').format(this);
  }
}
