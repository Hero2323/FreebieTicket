import 'package:flutter/material.dart';

import '../../domain/models/event.dart';
import '../event_details/event_details_screen.dart';
import 'router_names.dart';

import '../main/main_screen.dart';

class AppRouter {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterNames.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case RouterNames.eventDetailsRoute:
        return MaterialPageRoute(
          builder: (_) => EventDetailsScreen(
            event: settings.arguments as Event,
          ),
        );
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
