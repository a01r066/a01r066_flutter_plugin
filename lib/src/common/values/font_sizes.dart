import 'package:flutter/material.dart';

class KFontSizes {
  KFontSizes._();

  static double heading20 = 20 + offset();
  static double heading22 = 22 + offset();
  static double heading24 = 24 + offset();
  static double heading26 = 26 + offset();
  static double heading28 = 28 + offset();
  static double heading32 = 32 + offset();
  static double heading62 = 62 + offset();
  static double heading68 = 68 + offset();
  static double heading70 = 70 + offset();
  static double heading82 = 82 + offset();
  static double heading88 = 88 + offset();
  static double title40 = 40 + offset();

  static double bodyText18 = 18 + offset();
  static double bodyText16 = 16 + offset();
  static double bodyText14 = 14 + offset();
  static double bodyText12 = 12 + offset();
  static double bodyText10 = 10 + offset();
  static double bodyText8 = 8 + offset();

  static double offset() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                .size
                .width >
            600
        ? 6
        : 0;
  }
}
