import 'package:flutter_riverpod/flutter_riverpod.dart';

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
