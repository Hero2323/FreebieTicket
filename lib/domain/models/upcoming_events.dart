import 'event.dart';

class UpcomingEvents {
  final int id;
  final List<Event> events;
  final DateTime date;
  final String? moreEventsImage;

  UpcomingEvents({
    required this.id,
    required this.events,
    required this.date,
    this.moreEventsImage,
  });
}
