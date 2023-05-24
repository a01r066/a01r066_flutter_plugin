import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'a01r066_method_channel.dart';

abstract class A01r066Platform extends PlatformInterface {
  /// Constructs a A01r066Platform.
  A01r066Platform() : super(token: _token);

  static final Object _token = Object();

  static A01r066Platform _instance = MethodChannelA01r066();

  /// The default instance of [A01r066Platform] to use.
  ///
  /// Defaults to [MethodChannelA01r066].
  static A01r066Platform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [A01r066Platform] when
  /// they register themselves.
  static set instance(A01r066Platform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
