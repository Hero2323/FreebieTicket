import '../../models/upcoming_events.dart';

class GetUpcomingEventsResponse {
  final int status;
  final String message;
  final List<UpcomingEvents> upcomingevents;

  GetUpcomingEventsResponse(this.status, this.message, this.upcomingevents);
}
