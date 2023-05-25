import 'package:a01r066/a01r066.dart';
import 'package:flutter/material.dart';

/// The wrap example
class WrapExample extends StatelessWidget {
  /// The constructor for the wrap example
  const WrapExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrap demo'),
      ),
      body: DynamicGridView.builder(
        gridDelegate: const SliverGridDelegateWithWrapping(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: index.isEven ? index % 7 * 50 + 150 : index % 4 * 50 + 100,
            width: index.isEven ? index % 5 * 20 + 40 : index % 3 * 50 + 100,
            color: index.isEven
                ? Colors.red[(index % 7 + 1) * 100]
                : Colors.blue[(index % 7 + 1) * 100],
            child: Center(
              child: Text('Index $index'),
            ),
          );
        },
      ),
    );
  }
}
