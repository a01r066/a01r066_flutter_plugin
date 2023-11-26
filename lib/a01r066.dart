export 'src/src.dart';
import 'a01r066_platform_interface.dart';

class A01r066 {
  Future<String?> getPlatformVersion() {
    return A01r066Platform.instance.getPlatformVersion();
  }
}
