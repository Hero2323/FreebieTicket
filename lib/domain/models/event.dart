class Event {
  final String title;
  final String description;
  final String image;
  final String genre;
  final String date;
  final String time;
  final List<String> location;
  final List<int> prices;
  final String organizer;
  final List<int> discountPrices;

  Event({
    required this.title,
    required this.description,
    required this.image,
    required this.genre,
    required this.date,
    required this.time,
    required this.location,
    required this.prices,
    required this.organizer,
    required this.discountPrices,
  });
}
