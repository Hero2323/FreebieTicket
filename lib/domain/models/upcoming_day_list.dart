import 'event.dart';

class UpcomingDayList {
  final List<Event> upcomingList;
  final DateTime date;
  final String? moreUpcomingImage;

  UpcomingDayList({
    required this.upcomingList,
    required this.date,
    this.moreUpcomingImage,
  });
}
