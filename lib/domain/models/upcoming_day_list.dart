import 'upcoming.dart';

class UpcomingDayList {
  final List<Upcoming> upcomingList;
  final DateTime date;
  final String? moreUpcomingImage;

  UpcomingDayList({
    required this.upcomingList,
    required this.date,
    this.moreUpcomingImage,
  });
}
