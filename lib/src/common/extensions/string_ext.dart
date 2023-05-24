import 'package:a01r066/a01r066.dart';

extension StringX on String {
  String capitalizeFirst() {
    if (length > 0) {
      return '${this[0].toUpperCase()}${substring(1)}';
    }
    return this;
  }

  String firstLetterUppercase() {
    if (isEmpty) {
      return '';
    } else {
      final firstLetter = substring(0, 1);
      final rest = substring(1, length);
      return firstLetter.toUpperCase() + rest;
    }
  }

  String capitalizeName() {
    return split(" ").map((e) => KUtils.capitalize(e)).join(" ");
  }

  /*
  main() {
     print('Pizza'.prefixWith('I love'));
  }
  Output: I love Pizza
  */
  String prefixWith(String prefix) {
    return '$prefix $this';
  }

  /*
  main() {
     print('Pizza'&'I Love');
  }
  Output: I love Pizza
   */
  String operator &(String prefix) => '$prefix $this';
}
