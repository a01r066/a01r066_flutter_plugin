import 'package:flutter/services.dart';

class SampleCallNativeFlutter {
  static const MethodChannel _channel = MethodChannel('a01r066');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
