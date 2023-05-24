import 'package:a01r066_example/gen/localization/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:a01r066/a01r066.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with KDialogsMixin {
  String _platformVersion = 'Unknown';
  final _a01r066FlutterPlugin = A01r066();

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _a01r066FlutterPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        // localizationsDelegates: AppLocalizations.localizationsDelegates,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // supportedLocales: [
        //   Locale('en', ''), // English, no country code
        //   Locale('es', ''), // Spanish, no country code
        // ],
        supportedLocales: S.delegate.supportedLocales,
        builder: (BuildContext context, Widget? child) {
          // Prevent system preferred font size
          Widget fixedFontSizeWidget = MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child!,
          );

          // Easy loading
          fixedFontSizeWidget =
              EasyLoading.init()(context, fixedFontSizeWidget);
          return fixedFontSizeWidget;
        },
        home: Scaffold(
            appBar: AppBar(title: const Text('A01R066 Flutter Plugin')),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text('Running on: $_platformVersion\n'),

                  /// Phần 2. Hướng dẫn tạo Widget với plugin
                  KTextButton(
                      text: "Click me!",
                      backgroundColor: Colors.red,
                      textStyle: const TextStyle(color: Colors.white),
                      onPressed: () {
                        if (kDebugMode) {
                          print("Widget với plugin");
                          EasyLoading.showToast("Widget với plugin");
                        }
                      }),

                  /// Phần 3. Hướng dẫn gọi native code từ plugin
                  FutureBuilder<String?>(
                      future: SampleCallNativeFlutter.platformVersion,
                      builder: (_, snapshot) {
                        return Text(
                          "Native code: ${snapshot.data}" ?? "",
                          style: const TextStyle(color: KColors.error),
                        );
                      }),
                ]))));
  }
}
