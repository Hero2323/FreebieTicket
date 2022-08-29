import 'package:flutter/material.dart';

import 'router_names.dart';

import '../main/main_screen.dart';

class AppRouter {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterNames.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('noRouteFound')),
        body: const Center(child: Text('noRouteFound')),
      ),
    );
  }
}
