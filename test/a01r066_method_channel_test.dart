import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:a01r066/a01r066_method_channel.dart';

void main() {
  MethodChannelA01r066 platform = MethodChannelA01r066();
  const MethodChannel channel = MethodChannel('a01r066');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
