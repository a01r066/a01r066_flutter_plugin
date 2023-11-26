import 'package:a01r066/a01r066.dart';
import 'package:a01r066_example/configs/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  _buildBody() {
    return Wrap(
      children: [
        TextButton(
            onPressed: () {
              KLogger.info("Flutter plugin");
              Navigator.of(context).pushNamed(RoutePaths.pluginPage);
            },
            child: const Text("Flutter plugin")),
        TextButton(
            onPressed: () {
              KLogger.info("Dynamic layouts");
              Navigator.of(context).pushNamed(RoutePaths.dynamicsLayoutPage);
            },
            child: const Text("Dynamic layouts"))
      ],
    );
  }
}
