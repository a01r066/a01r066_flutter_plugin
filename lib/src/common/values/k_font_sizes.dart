
import 'package:a01r066/src/common/values/device_type.dart';

class KFontSize {
  KFontSize._();

  // VieZ - Version 2
  static double heading20 = 20 + offset();
  static double heading22 = 22 + offset();
  static double heading24 = 24 + offset();
  static double heading26 = 26 + offset();
  static double heading28 = 28 + offset();
  static double heading32 = 32 + offset();
  static double heading36 = 36 + offset();
  static double heading40 = 40 + offset();
  static double heading44 = 44 + offset();
  static double heading48 = 48 + offset();
  static double heading56 = 56 + offset();
  static double heading62 = 62 + offset();
  static double heading64 = 64 + offset();
  static double heading68 = 68 + offset();
  static double heading70 = 70 + offset();
  static double heading82 = 82 + offset();
  static double heading88 = 88 + offset();

  static double bodyText18 = 18 + offset();
  static double bodyText16 = 16 + offset();
  static double bodyText14 = 14 + offset();
  static double bodyText12 = 12 + offset();
  static double bodyText10 = 10 + offset();
  static double bodyText8 = 8 + offset();

  static double offset() {
    return Device.get().isTablet ? 6 : 0;
  }
}
