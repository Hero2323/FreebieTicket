import 'package:flutter/material.dart'
    show
        BorderRadius,
        BuildContext,
        RoundedRectangleBorder,
        TextDirection,
        TextPainter,
        TextSpan,
        TextStyle,
        ThemeData,
        showModalBottomSheet;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'
    show LatLng, Marker, MarkerId;

import '../presentation/resources/asset_images.dart';
import '../presentation/styles/app_theme.dart';
import '../presentation/widgets/search_bottom_sheet.dart';
import 'models/event.dart';
import 'providers.dart';

extension CurrentTheme on WidgetRef {
  ThemeData get theme => watch(themeProvider);

  void toggleTheme() => read(themeProvider) == getApplicationLightTheme()
      ? read(themeProvider.notifier).state = getApplicationDarkTheme()
      : read(themeProvider.notifier).state = getApplicationLightTheme();
}

extension BottomNavigationBarIndex on WidgetRef {
  int get bottomBarIndex => watch(bottomBarIndexProvider);

  void setBottomBarIndex(int index) =>
      read(bottomBarIndexProvider.notifier).state = index;
}

extension SelectedFilter on WidgetRef {
  bool isSelected(int index) => watch(selectedFilterProvider) == index;

  void setSelectedFilter(int index) {
    if (index == read(selectedFilterProvider)) {
      read(selectedFilterProvider.notifier).state = -1;
    } else {
      read(selectedFilterProvider.notifier).state = index;
    }
  }
}

extension ShowMore on WidgetRef {
  bool get showMore => watch(eventDetailsShowMoreProvider);
  void toggleShowMore() => read(eventDetailsShowMoreProvider.notifier).state =
      !read(eventDetailsShowMoreProvider);
}

extension EventUpdates on WidgetRef {
  bool get updateNotification => watch(eventDetailsUpdateNotificationProvider);
  void toggleUpdateNotification() =>
      read(eventDetailsUpdateNotificationProvider.notifier).state =
          !read(eventDetailsUpdateNotificationProvider);
  bool get updatesReadMore => watch(eventDetailsUpdatesReadMoreProvider);
  void toggleUpdatesReadMore() =>
      read(eventDetailsUpdatesReadMoreProvider.notifier).state =
          !read(eventDetailsUpdatesReadMoreProvider);
}

extension SelectedEventsIndex on WidgetRef {
  bool get updateEventsNumber => watch(selectedEventsIndexProvider);

  void toggleEventsNumber() =>
      read(selectedEventsIndexProvider.notifier).state =
          !read(selectedEventsIndexProvider);
}

extension SelectedPlacesIndex on WidgetRef {
  bool get updatePlacesNumber => watch(selectedPlacesIndexProvider);

  void togglePlacesNumber() =>
      read(selectedPlacesIndexProvider.notifier).state =
          !read(selectedPlacesIndexProvider);
}

extension MyTicketsFilter on WidgetRef {
  bool isSelectedMyTickets(int index) =>
      watch(myTicketsFilterProvider) == index;

  void setSelectedMyTicketsFilter(int index) {
    if (index == read(myTicketsFilterProvider)) {
      read(myTicketsFilterProvider.notifier).state = -1;
    } else {
      read(myTicketsFilterProvider.notifier).state = index;
    }
  }
}

extension MoreUpcomingEvents on WidgetRef {
  List<bool> get showMoreUpcomingEvents =>
      watch(showMoreUpcomingEventsProvider);

  void toggleShowMoreUpcomingEvents(int index) {
    final List<bool> showMoreUpcomingEvents =
        List.from(read(showMoreUpcomingEventsProvider));
    showMoreUpcomingEvents[index] = !showMoreUpcomingEvents[index];
    read(showMoreUpcomingEventsProvider.notifier).state =
        showMoreUpcomingEvents;
  }
}

extension EventsLoaded on WidgetRef {
  bool get eventsLoaded => watch(eventsLoadedProvider);

  void setEventsLoaded(bool value) =>
      read(eventsLoadedProvider.notifier).state = value;
}

extension WillTextOverflow on String {
  bool willTextOverflow(TextStyle style,
      {double minWidth = 0,
      double maxWidth = double.infinity,
      int maxLines = 2}) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: this, style: style),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: minWidth, maxWidth: maxWidth);
    return textPainter.didExceedMaxLines;
  }
}

extension SharedEvents on WidgetRef {
  List<Event> get sharedEvents => watch(sharedEventsProvider);

  void setSharedEvents(List<Event> events) =>
      read(sharedEventsProvider.notifier).state = events;

  String getMarkerIcon(Event event) {
    if (event.label == 'sports')
      return 'assets/images/sport_marker.png';
    else if (event.label == 'art')
      return 'assets/images/sport_marker.png';
    else
      return 'assets/images/music_marker.png';
  }

  Map<String, Marker> initMarkersMap() => {
        for (final event in sharedEvents)
          '${event.id}': Marker(
            markerId: MarkerId('${event.id}'),
            position: LatLng(event.eventLatLng.lat, event.eventLatLng.lng),
          )
      };

  Map<String, Marker> get markersMap => watch(markersMapProvider);

  void setMarker(Marker marker) {
    read(markersMapProvider.notifier).state[marker.markerId.value] = marker;
  }
}
