import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static String printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    final inHoursStr = twoDigits(duration.inHours) == "00"
        ? ""
        : "${twoDigits(duration.inHours)}:";
    return "$inHoursStr$twoDigitMinutes:$twoDigitSeconds";
  }

  static String getPosition(Duration duration) {
    return [duration.inMinutes, duration.inSeconds]
        .map((seg) => seg.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }

  static String getTimeDifferentBetween(DateTime from, DateTime to) {
    int seconds = to.difference(from).inSeconds;
    if (seconds < 60) {
      return "$seconds seconds";
    } else if (seconds >= 60 && seconds < 3600) {
      return '${from.difference(to).inMinutes.abs()} minutes';
    } else if (seconds >= 3600 && seconds < 86400) {
      return '${from.difference(to).inHours} hour';
    } else {
      return '${from.difference(to).inDays} day';
    }
  }

  static bool isGreaterThanMinute(
      {required DateTime from, required DateTime to, required int minute}) {
    if (from.difference(to).inMinutes.abs() > minute) {
      return true;
    }
    return false;
  }

  static String getDayGreeting(BuildContext context) {
    String greeting = "";
    final now = DateTime.now().hour;
    if (now < 12) {
      greeting = "Good morning!";
    } else if (now < 18) {
      greeting = "Good afternoon!";
    } else {
      greeting = "Good evening!";
    }
    return greeting;
  }

  static DateTime convertToDateFromString(String input,
      {String inputFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"}) {
    // return DateFormat(inputFormat).parse(input, true).toLocal();
    return DateFormat(inputFormat).parse(input, true);
  }

  static String getDotDateString(DateTime dt) {
    String monthStr = "${dt.month}";
    String dayStr = "${dt.day}";

    if (dt.month < 10) {
      monthStr = "0$monthStr";
    }

    if (dt.day < 10) {
      dayStr = "0$dayStr";
    }

    return "$dayStr.$monthStr\n${dt.year}";
  }

  static String getStatisticDateString(
      {required DateTime dateTime, bool? isShortDateTime}) {
    String formatString =
        isShortDateTime != null ? "dd.MM.yyyy" : "dd.MM.yyyy HH:mm";
    final statisticDateString =
        DateFormat(formatString).format(dateTime.toLocal());
    return statisticDateString;
  }

  static String getTimeString() {
    DateTime dt = DateTime.now();
    String hour = "${dt.hour}";
    String min = "${dt.minute}";
    if (dt.hour < 10) {
      hour = "0$hour";
    }
    if (dt.minute < 10) {
      min = "0$min";
    }
    return "$hour:$min";
  }

  static String getTodayString() {
    String formatString = "dd.MM.yyyy";
    DateTime today = DateTime.now();
    final currentDateString = DateFormat(formatString).format(today.toLocal());
    final weekday = translateWeekday(today.weekday);
    return "$weekday, $currentDateString";
  }

  static String translateWeekday(int day) {
    String weekDay = "";
    switch (day) {
      case 1:
        weekDay = "Thứ 2";
        break;
      case 2:
        weekDay = "Thứ 3";
        break;
      case 3:
        weekDay = "Thứ 4";
        break;
      case 4:
        weekDay = "Thứ 5";
        break;
      case 5:
        weekDay = "Thứ 6";
        break;
      case 6:
        weekDay = "Thứ 7";
        break;
      case 7:
        weekDay = "Chủ nhật";
        break;
    }
    return weekDay;
  }

  static String convertToDateString(String input,
      {String inputFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
      String outputFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"}) {
    String result = "";
    try {
      DateTime parseDate = DateFormat(inputFormat).parse(input, true);
      result = DateFormat(outputFormat).format(parseDate.toLocal());
    } catch (e) {
      result = "";
    }
    return result;
  }

  static String convertToDateTimeString(String input,
      {String inputFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
      String outputFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"}) {
    String result = "";
    try {
      DateTime parseDate = DateFormat(inputFormat).parse(input);
      result = DateFormat(outputFormat).format(parseDate.toLocal());
    } catch (e) {
      result = "";
    }
    return result;
  }
}

class Debouncer {
  final int milliseconds;
  final Function()? action;
  Timer? _timer;

  Debouncer({required this.milliseconds, this.action});

  run(Function() action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
