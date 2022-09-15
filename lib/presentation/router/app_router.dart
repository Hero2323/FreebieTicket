import 'package:flutter/material.dart';
import 'package:ticket_app/presentation/new_card/new_card_screen.dart';
import 'package:ticket_app/presentation/payment/payment_screen.dart';

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
            builder: (_) =>
                EventDetailsScreen(event: settings.arguments as Event));
      case RouterNames.paymentRoute:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case RouterNames.newCardRoute:
        return MaterialPageRoute(builder: (_) => const NewCardScreen());
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
