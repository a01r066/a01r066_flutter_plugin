import 'package:a01r066_example/configs/routes.dart';
import 'package:a01r066_example/gen/localization/l10n.dart';
import 'package:a01r066_example/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
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
        onGenerateRoute: Routes.generateRoute,
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
          body: const HomePage(),
        ));
  }
}
