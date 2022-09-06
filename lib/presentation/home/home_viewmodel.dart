import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_app/domain/repository/events_repository.dart';

import '../../domain/models/event.dart';
import '../../domain/models/upcoming_events.dart';
import '../../domain/providers.dart';

class HomeViewModel {
  EventsRepository eventsRepository = EventsRepository();
  List<Event> events = [];
  List<UpcomingEvents> upcomingEvents = [];

  init(WidgetRef ref) {
    getEvents(ref);
    getUpcomingEvents(ref);
  }

  getEvents(WidgetRef ref) => eventsRepository.getEvents().then((value) {
        events.addAll(value);
        ref.read(forYouProvider.notifier).state = true;
      });

  getUpcomingEvents(WidgetRef ref) =>
      eventsRepository.getUpcomingEvents().then((value) {
        upcomingEvents.addAll(value);
        ref.read(showMoreUpcomingEventsProvider.notifier).state =
            upcomingEvents.map((e) => false).toList();
      });
}
