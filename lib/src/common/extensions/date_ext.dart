import 'package:a01r066/a01r066.dart';

extension DateTimeX on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.year == year && now.month == month && now.day == day;
  }

  bool isGreaterThanMinute({required int minute}) {
    final now = DateTime.now();
    KLogger.info("difference minutes: ${now.difference(this).inMinutes.abs()}");
    if (now.difference(this).inMinutes.abs() > minute) {
      return true;
    }
    return false;
  }
}
