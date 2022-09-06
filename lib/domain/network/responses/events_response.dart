import '../../models/event.dart';

class GetEventsResponse {
  final int status;
  final String message;
  final List<Event> events;

  GetEventsResponse(this.status, this.message, this.events);
}
