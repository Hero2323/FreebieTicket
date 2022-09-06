import 'package:ticket_app/domain/repository/events_repository.dart';

import '../../domain/models/event.dart';
import '../../domain/models/upcoming_events.dart';

class HomeViewModel {
  EventsRepository eventsRepository = EventsRepository();
  List<Event> events = [];
  List<UpcomingEvents> upcomingEvents = [];

  init() {
    getEvents();
    getUpcomingEvents();
  }

  getEvents() =>
      eventsRepository.getEvents().then((value) => events.addAll(value));

  getUpcomingEvents() => eventsRepository
      .getUpcomingEvents()
      .then((value) => upcomingEvents.addAll(value));
}
