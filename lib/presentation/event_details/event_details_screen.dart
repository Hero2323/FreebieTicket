import 'package:flutter/material.dart';
import '../../domain/models/event.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;
  const EventDetailsScreen({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(event.image),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
