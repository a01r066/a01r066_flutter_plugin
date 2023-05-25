import 'package:a01r066_example/presentation/pages/dynamic_layouts_page.dart';
import 'package:a01r066_example/presentation/pages/home_page.dart';
import 'package:a01r066_example/presentation/pages/plugin_demo_page.dart';
import 'package:a01r066_example/presentation/widgets/staggered_layout_example.dart';
import 'package:a01r066_example/presentation/widgets/wrap_layout_example.dart';
import 'package:flutter/material.dart';

class RoutePaths {
  static const String pluginPage = "/pluginPage";

  static const String dynamicsLayoutPage = "/dynamicsLayoutPage";
  static const String wrapLayoutPage = "/wrapLayoutPage";
  static const String staggeredLayoutPage = "/staggeredLayoutPage";
}

class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.pluginPage:
        return _materialRoute(const PluginDemoPage(), settings);
      case RoutePaths.dynamicsLayoutPage:
        return _materialRoute(const DynamicLayoutsPage(), settings);
      case RoutePaths.wrapLayoutPage:
        return _materialRoute(const WrapExample(), settings);
      case RoutePaths.staggeredLayoutPage:
        return _materialRoute(const StaggeredExample(), settings);
      default:
        return _materialRoute(const HomePage(), settings);
    }
  }

  static Route<dynamic> _materialRoute(Widget view, RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => view, settings: settings);
  }
}
