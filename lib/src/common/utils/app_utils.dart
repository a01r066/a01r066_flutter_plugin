import 'dart:io';
import 'dart:math';
import 'package:a01r066/a01r066.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KUtils {
  static String getUniqueIdFromUrl({required String url}) {
    final uri = Uri.parse(url);
    final host = uri.host;
    final path = uri.path;
    final fragment = uri.fragment;
    final queryParams = uri.queryParameters;
    KLogger.info('Schema: ${uri.scheme}'
        '\nhost: $host'
        '\npath: $path'
        '\nfragment: $fragment'
        '\nparameters: $queryParams');
    final uniqueId = path.split("-").last.split(".").first;
    return uniqueId;
  }

  static List shuffle(List array) {
    var random = Random(); //import 'dart:math';

    for (var i = array.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = array[i];
      array[i] = array[n];
      array[n] = temp;
    }
    return array;
  }

  static String getViewCounter(int count) {
    String counterString = "$count";
    if (count > 1000) {
      counterString = "${(count / 1000).toStringAsFixed(1)}k";
    }
    return counterString;
  }

  static get platform => Platform.operatingSystem;

  static SystemUiOverlayStyle buildSystemTheme(bool isDark) {
    return SystemUiOverlayStyle(
        systemNavigationBarColor: null,
        systemNavigationBarDividerColor: null,
        systemNavigationBarIconBrightness:
            isDark ? Brightness.dark : Brightness.light,
        statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
        // statusBarColor: isDark ? Colors.black : Colors.white,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark);
  }

  static LinearGradient getAppLinearGradientStyle() {
    return const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        transform: GradientRotation(pi / 4),
        colors: [
          KColors.indicatorColor3,
          KColors.indicatorColor2,
          KColors.indicatorColor1
        ]);
  }

  static LinearGradient getLinearGradientStyle(List<Color> colors) {
    return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        // transform: const GradientRotation(pi / 4),
        colors: colors);
  }

  static LinearGradient getCustomLinearGradientStyle(
      List<Color> colors, AlignmentGeometry? begin, AlignmentGeometry? end) {
    return LinearGradient(
        begin: begin ?? Alignment.topCenter,
        end: end ?? Alignment.bottomCenter,
        // transform: const GradientRotation(pi / 4),
        colors: colors);
  }

  static String capitalize(String value) {
    if (value.trim().isEmpty) return "";
    return "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
  }

  static List<String> generateAlphabets() {
    List<String> alphabets = [];

    for (int i = 65; i <= 90; i++) {
      alphabets.add(String.fromCharCode(i));
    }
    return alphabets;
  }

  static String mapIndexToAlphabet(int index) {
    var alphabet = [
      'a',
      'b',
      'c',
      'd',
      'e',
      'f',
      'g',
      'h',
      'i',
      'j',
      'k',
      'l',
      'm',
      'n',
      'o',
      'p',
      'q',
      'r',
      's',
      't',
      'u',
      'v',
      'w',
      'x',
      'y',
      'z'
    ];
    return alphabet[index].toUpperCase();
  }

  static String removeNonASCII(String str) {
    final arrCharactorData = [
      [
        "á",
        "à",
        "ả",
        "ã",
        "ạ",
        "ă",
        "ắ",
        "ằ",
        "ẳ",
        "ẵ",
        "ặ",
        "â",
        "ấ",
        "ầ",
        "ẩ",
        "ẫ",
        "ậ"
      ],
      [
        "Á",
        "À",
        "Ả",
        "Ã",
        "Ạ",
        "Ă",
        "Ắ",
        "Ằ",
        "Ẳ",
        "Ẵ",
        "Ặ",
        "Â",
        "Ấ",
        "Ầ",
        "Ẩ",
        "Ẫ",
        "Ậ"
      ],
      ["é", "è", "ẻ", "ẽ", "ẹ", "ê", "ế", "ề", "ể", "ễ", "ệ"],
      ["É", "È", "Ẻ", "Ẽ", "Ẹ", "Ê", "Ế", "Ề", "Ể", "Ễ", "Ệ"],
      [
        "ó",
        "ò",
        "ỏ",
        "õ",
        "ọ",
        "ô",
        "ố",
        "ồ",
        "ổ",
        "ỗ",
        "ộ",
        "ơ",
        "ớ",
        "ờ",
        "ở",
        "ỡ",
        "ợ"
      ],
      [
        "Ó",
        "Ò",
        "Ỏ",
        "Õ",
        "Ọ",
        "Ô",
        "Ố",
        "Ồ",
        "Ổ",
        "Ỗ",
        "Ộ",
        "Ơ",
        "Ớ",
        "Ờ",
        "Ở",
        "Ỡ",
        "Ợ"
      ],
      ["í", "ì", "ỉ", "ĩ", "ị"],
      ["Í", "Ì", "Ỉ", "Ĩ", "Ị"],
      ["ú", "ù", "ủ", "ũ", "ụ", "ư", "ứ", "ừ", "ử", "ữ", "ự"],
      ["Ú", "Ù", "Ủ", "Ũ", "Ụ", "Ư", "Ứ", "Ừ", "Ử", "Ữ", "Ự"],
      ["ý", "ỳ", "ỷ", "ỹ", "ỵ"],
      ["Ý", "Ỳ", "Ỷ", "Ỹ", "Ỵ"],
      ["đ"],
      ["Đ"],
    ];

    final arrResultsCharactorData = [
      "a",
      "A",
      "e",
      "E",
      "o",
      "O",
      "i",
      "I",
      "u",
      "U",
      "y",
      "Y",
      "d",
      "D"
    ];
    String result = str;
    arrCharactorData.forEachIndexed((index, element) {
      for (var element in element) {
        result = result.replaceAll(element, arrResultsCharactorData[index]);
      }
    });
    return result;
  }
}
