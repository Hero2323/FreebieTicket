import 'package:ticket_app/domain/models/organizer.dart';
import 'update.dart';

class Event {
  final int id;
  final String title;
  final String details;
  final String image;
  final String genre;
  final String date;
  final String time;
  final List<String> location;
  final List<int> prices;
  final List<int> discountPrices;
  final List<Update> updates;
  final Organizer organizer;

  Event({
    required this.id,
    required this.title,
    required this.details,
    required this.image,
    required this.genre,
    required this.date,
    required this.time,
    required this.location,
    required this.prices,
    required this.organizer,
    required this.discountPrices,
    required this.updates,
  });
}
