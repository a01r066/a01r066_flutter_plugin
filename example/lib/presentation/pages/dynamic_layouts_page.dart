import 'package:a01r066_example/configs/routes.dart';
import 'package:flutter/material.dart';

class DynamicLayoutsPage extends StatelessWidget {
  const DynamicLayoutsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamics layout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RoutePaths.wrapLayoutPage);
                },
                child: const Text("Wrap layout")),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(RoutePaths.staggeredLayoutPage);
                },
                child: const Text("Staggered layout")),
          ],
        ),
      ),
    );
  }
}
