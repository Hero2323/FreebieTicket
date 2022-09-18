import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'
    show LatLng, Marker, MarkerId;

import '../presentation/styles/app_theme.dart';
import 'models/event.dart';
import 'package:ticket_app/presentation/payment/payment_states.dart';

import '../presentation/styles/app_theme.dart';

final themeProvider = StateProvider((ref) => getApplicationLightTheme());

final bottomBarIndexProvider = StateProvider((ref) => 0);

final selectedFilterProvider = StateProvider((ref) => -1);

final eventDetailsShowMoreProvider = StateProvider((ref) => false);

final eventDetailsUpdateNotificationProvider =
    StateProvider.autoDispose((ref) => false);

final eventDetailsUpdatesReadMoreProvider =
    StateProvider.autoDispose((ref) => false);
final selectedEventsIndexProvider = StateProvider((ref) => false);

final selectedPlacesIndexProvider = StateProvider((ref) => false);

final myTicketsFilterProvider = StateProvider((ref) => -1);

final showMoreUpcomingEventsProvider = StateProvider<List<bool>>((ref) => []);

final forYouProvider = StateProvider((ref) => false);

final eventsLoadedProvider = StateProvider(
  (ref) =>
      ref.watch(showMoreUpcomingEventsProvider).isNotEmpty &&
      ref.watch(forYouProvider),
);

final sharedEventsProvider = StateProvider<List<Event>>((ref) => []);

final markersMapProvider = StateProvider<Map<String, Marker>>((ref) => {});

final paymentStateProvider =
    StateProvider<PaymentStates>((ref) => InitialPaymentState());

final filteredUpcomingEventsProvider =
    StateProvider.family<List<Event>, List<Event>>((ref, events) {
  final selectedFilter = ref.watch(selectedFilterProvider);
  if (selectedFilter == -1) {
    return events;
  } else if (selectedFilter == 0) {
    return events.where((event) => event.label == 'art').toList();
  } else if (selectedFilter == 1) {
    return events.where((event) => event.label == 'music').toList();
  } else {
    return events.where((event) => event.label == 'sport').toList();
  }
});

final eventDetailsMarkersMapProvider = StateProvider<Map<String, Marker>>(
  (ref) => {},
);
