import 'package:flutter/material.dart';
import 'package:flutter_template/main.dart';

const _home = '/';

abstract class AppRoute {
  static String get home => _home;
}

final navigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case _home:
        return _materialRoute(const MyApp());
      default:
        return _materialRoute(const MyApp());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }

  static Route onUnkownRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => const MyApp());
  }
}
