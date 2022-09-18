import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show Marker;

import '../presentation/styles/app_theme.dart';
import 'models/event.dart';

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
