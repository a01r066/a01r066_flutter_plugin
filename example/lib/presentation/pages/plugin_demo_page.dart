import 'package:a01r066/a01r066.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class PluginDemoPage extends StatefulWidget {
  const PluginDemoPage({Key? key}) : super(key: key);

  @override
  State<PluginDemoPage> createState() => _PluginDemoPageState();
}

class _PluginDemoPageState extends State<PluginDemoPage> {
  String _platformVersion = 'Unknown';
  final _a01r066FlutterPlugin = A01r066();

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin demo'),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                "Native code: ${snapshot.data}",
                style: const TextStyle(color: KColors.error),
              );
            }),
      ])),
    );
  }
}
