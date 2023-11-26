import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'a01r066_platform_interface.dart';

/// An implementation of [A01r066Platform] that uses method channels.
class MethodChannelA01r066 extends A01r066Platform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('a01r066');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
