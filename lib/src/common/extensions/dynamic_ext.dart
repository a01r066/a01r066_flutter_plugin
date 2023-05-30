import 'package:a01r066/src/common/get_utils/get_utils.dart';

extension DynamicX on dynamic {
  String stringify() {
    return '{$runtimeType: ${jsonEncode(this)}}';
  }

  bool? get isBlank => GetUtils.isBlank(this);
}
