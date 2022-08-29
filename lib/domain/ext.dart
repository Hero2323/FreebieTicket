import 'package:flutter/material.dart' show ThemeData;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../presentation/styles/app_theme.dart';
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
