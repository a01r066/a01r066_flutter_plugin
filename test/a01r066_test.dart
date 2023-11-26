import 'package:flutter_test/flutter_test.dart';
import 'package:a01r066/a01r066.dart';
import 'package:a01r066/a01r066_platform_interface.dart';
import 'package:a01r066/a01r066_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockA01r066Platform
    with MockPlatformInterfaceMixin
    implements A01r066Platform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final A01r066Platform initialPlatform = A01r066Platform.instance;

  test('$MethodChannelA01r066 is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelA01r066>());
  });

  test('getPlatformVersion', () async {
    A01r066 a01r066Plugin = A01r066();
    MockA01r066Platform fakePlatform = MockA01r066Platform();
    A01r066Platform.instance = fakePlatform;

    expect(await a01r066Plugin.getPlatformVersion(), '42');
  });
}
