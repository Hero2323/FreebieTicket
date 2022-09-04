import 'package:ticket_app/domain/models/update.dart';

import '../../domain/models/event.dart';
import '../../domain/models/filter.dart';
import '../../domain/models/upcoming_events.dart';
import '../resources/asset_images.dart';
import '../styles/app_colors.dart';

List<UpcomingEvents> upcomingEvents = [
  UpcomingEvents(
    id: 1,
    events: [
      Event(
        id: 1,
        title: 'Brightlight Music Festival',
        genre: 'Indie Rock',
        prices: [40, 60, 90],
        image: AssetImages.upcoming,
        details: 'Indie Rock',
        date: 'Friday, 24 Aug 2019',
        time: '6:30PM - 9:30PM',
        location: ['Daboi Concert Hall', '5/7 Kolejowa, 01-217 Warsaw'],
        organizer: 'Club Kiss',
        discountPrices: [30, 80],
        updates: [
          Update(
            id: 1,
            date: DateTime(2019, 8, 14),
            contents: 'Customers that are searching for a particular topic. '
                'What\'s great about them is that you only have to lookup one '
                'topic and you\'ll get a list of all the related topics.',
          ),
        ],
      ),
      Event(
        id: 2,
        title: 'Brightlight Music Festival',
        genre: 'Indie Rock',
        prices: [40, 60, 90],
        image: AssetImages.upcoming,
        details: 'Indie Rock',
        date: 'Friday, 24 Aug 2019',
        time: '6:30PM - 9:30PM',
        location: ['Daboi Concert Hall', '5/7 Kolejowa, 01-217 Warsaw'],
        organizer: 'Club Kiss',
        discountPrices: [30, 80],
        updates: [
          Update(
            id: 1,
            date: DateTime(2019, 8, 14),
            contents: 'Customers that are searching for a particular topic. '
                'What\'s great about them is that you only have to lookup one '
                'topic and you\'ll get a list of all the related topics.',
          ),
          Update(
            id: 1,
            date: DateTime(2019, 8, 21),
            contents: 'Customers that are searching for a particular topic. '
                'What\'s great about them is that you only have to lookup one '
                'topic and you\'ll get a list of all the related topics.',
          ),
        ],
      ),
      Event(
        id: 3,
        title: 'Brightlight Music Festival',
        genre: 'Indie Rock',
        prices: [40, 60, 90],
        image: AssetImages.upcoming,
        details: 'Indie Rock',
        date: 'Friday, 24 Aug 2019',
        time: '6:30PM - 9:30PM',
        location: ['Daboi Concert Hall', '5/7 Kolejowa, 01-217 Warsaw'],
        organizer: 'Club Kiss',
        discountPrices: [30, 80],
        updates: [
          Update(
            id: 1,
            date: DateTime(2019, 8, 14),
            contents: 'Customers that are searching for a particular topic. '
                'What\'s great about them is that you only have to lookup one '
                'topic and you\'ll get a list of all the related topics.',
          ),
        ],
      ),
      Event(
        id: 4,
        title: 'Brightlight Music Festival',
        genre: 'Indie Rock',
        prices: [40, 60, 90],
        image: AssetImages.upcoming,
        details: 'Indie Rock',
        date: 'Friday, 24 Aug 2019',
        time: '6:30PM - 9:30PM',
        location: ['Daboi Concert Hall', '5/7 Kolejowa, 01-217 Warsaw'],
        organizer: 'Club Kiss',
        discountPrices: [30, 80],
        updates: [
          Update(
            id: 1,
            date: DateTime(2019, 8, 14),
            contents: 'Customers that are searching for a particular topic. '
                'What\'s great about them is that you only have to lookup one '
                'topic and you\'ll get a list of all the related topics.',
          ),
          Update(
            id: 1,
            date: DateTime(2019, 8, 21),
            contents: 'Customers that are searching for a particular topic. '
                'What\'s great about them is that you only have to lookup one '
                'topic and you\'ll get a list of all the related topics.',
          ),
          Update(
            id: 1,
            date: DateTime(2019, 8, 23),
            contents: 'Customers that are searching for a particular topic. '
                'What\'s great about them is that you only have to lookup one '
                'topic and you\'ll get a list of all the related topics.',
          ),
        ],
      ),
    ],
    date: DateTime.now(),
    moreEventsImage: AssetImages.moreUpcoming,
  ),
  UpcomingEvents(
    id: 2,
    events: [
      Event(
        id: 5,
        title: 'Brightlight Music Festival',
        genre: 'Indie Rock',
        prices: [40, 60, 90],
        image: AssetImages.upcoming,
        details: 'Indie Rock',
        date: 'Friday, 24 Aug 2019',
        time: '6:30PM - 9:30PM',
        location: ['Daboi Concert Hall', '5/7 Kolejowa, 01-217 Warsaw'],
        organizer: 'Club Kiss',
        discountPrices: [30, 80],
      ),
      Event(
        id: 6,
        title: 'Brightlight Music Festival',
        genre: 'Indie Rock',
        prices: [40, 60, 90],
        image: AssetImages.upcoming,
        details: 'Indie Rock',
        date: 'Friday, 24 Aug 2019',
        time: '6:30PM - 9:30PM',
        location: ['Daboi Concert Hall', '5/7 Kolejowa, 01-217 Warsaw'],
        organizer: 'Club Kiss',
        discountPrices: [30, 80],
      ),
    ],
    date: DateTime(2022, 7, 15),
    moreEventsImage: AssetImages.moreUpcoming,
  ),
  UpcomingEvents(
    id: 3,
    events: [
      Event(
        id: 7,
        title: 'Brightlight Music Festival',
        genre: 'Indie Rock',
        prices: [40, 60, 90],
        image: AssetImages.upcoming,
        details: 'Indie Rock',
        date: 'Friday, 24 Aug 2019',
        time: '6:30PM - 9:30PM',
        location: ['Daboi Concert Hall', '5/7 Kolejowa, 01-217 Warsaw'],
        organizer: 'Club Kiss',
        discountPrices: [30, 80],
      ),
    ],
    date: DateTime(2022, 8, 12),
    moreEventsImage: AssetImages.moreUpcoming,
  ),
  UpcomingEvents(
    id: 4,
    events: [
      Event(
        id: 8,
        title: 'Brightlight Music Festival',
        genre: 'Indie Rock',
        prices: [40, 60, 90],
        image: AssetImages.upcoming,
        details: 'Indie Rock',
        date: 'Friday, 24 Aug 2019',
        time: '6:30PM - 9:30PM',
        location: ['Daboi Concert Hall', '5/7 Kolejowa, 01-217 Warsaw'],
        organizer: 'Club Kiss',
        discountPrices: [30, 80],
      ),
      Event(
        id: 9,
        title: 'Brightlight Music Festival',
        genre: 'Indie Rock',
        prices: [40, 60, 90],
        image: AssetImages.upcoming,
        details: 'Indie Rock',
        date: 'Friday, 24 Aug 2019',
        time: '6:30PM - 9:30PM',
        location: ['Daboi Concert Hall', '5/7 Kolejowa, 01-217 Warsaw'],
        organizer: 'Club Kiss',
        discountPrices: [30, 80],
      ),
      Event(
        id: 10,
        title: 'Brightlight Music Festival',
        genre: 'Indie Rock',
        prices: [40, 60, 90],
        image: AssetImages.upcoming,
        details: 'Indie Rock',
        date: 'Friday, 24 Aug 2019',
        time: '6:30PM - 9:30PM',
        location: ['Daboi Concert Hall', '5/7 Kolejowa, 01-217 Warsaw'],
        organizer: 'Club Kiss',
        discountPrices: [30, 80],
      ),
    ],
    date: DateTime(2022, 2, 1),
    moreEventsImage: AssetImages.moreUpcoming,
  ),
];

List<Event> collections = [
  Event(
    id: 11,
    title: 'Electronica Next Month',
    details: 'Free directories: directories are perfect for customers that '
        'are searching for a particular topic. What\'s great about them is '
        'that you only have to post once and they are good for long periods '
        'of time. It saves a lot of your time when you don\'t have to '
        'resubmit your information every week',
    image: AssetImages.collection,
    genre: 'Electronica',
    date: 'Friday, 24 Aug 2019',
    time: '6:30PM - 9:30PM',
    location: ['Daboi Concert Hall', '5/7 Kolejowa, 01-217 Warsaw'],
    prices: [40, 90],
    organizer: 'Club Kiss',
    discountPrices: [30, 80],
    updates: [
      Update(
        id: 1,
        date: DateTime(2019, 8, 14),
        contents: 'Customers that are searching for a particular topic. '
            'What\'s great about them is that you only have to lookup one '
            'topic and you\'ll get a list of all the related topics.',
      ),
      Update(
        id: 1,
        date: DateTime(2019, 8, 21),
        contents: 'Customers that are searching for a particular topic. '
            'What\'s great about them is that you only have to lookup one '
            'topic and you\'ll get a list of all the related topics.',
      ),
      Update(
        id: 1,
        date: DateTime(2019, 8, 23),
        contents: 'Customers that are searching for a particular topic. '
            'What\'s great about them is that you only have to lookup one '
            'topic and you\'ll get a list of all the related topics.',
      ),
    ],
  ),
  Event(
    id: 12,
    title: 'Electronica Next Month',
    details: 'Electronica',
    image: AssetImages.collection,
    genre: 'Electronica',
    date: 'Friday, 24 Aug 2019',
    time: '6:30PM - 9:30PM',
    location: ['Daboi Concert Hall', '5/7 Kolejowa, 01-217 Warsaw'],
    prices: [40, 90],
    organizer: 'Club Kiss',
    discountPrices: [30, 80],
  ),
  Event(
    id: 13,
    title: 'Electronica Next Month',
    details: 'Electronica',
    image: AssetImages.collection,
    genre: 'Electronica',
    date: 'Friday, 24 Aug 2019',
    time: '6:30PM - 9:30PM',
    location: ['Daboi Concert Hall', '5/7 Kolejowa, 01-217 Warsaw'],
    prices: [40, 90],
    organizer: 'Club Kiss',
    discountPrices: [30, 80],
    updates: [
      Update(
        id: 1,
        date: DateTime(2019, 8, 14),
        contents: 'Customers that are searching for a particular topic. '
            'What\'s great about them is that you only have to lookup one '
            'topic and you\'ll get a list of all the related topics.',
      ),
    ],
  ),
  Event(
    id: 14,
    title: 'Electronica Next Month',
    details: 'Electronica',
    image: AssetImages.collection,
    genre: 'Electronica',
    date: 'Friday, 24 Aug 2019',
    time: '6:30PM - 9:30PM',
    location: ['Daboi Concert Hall', '5/7 Kolejowa, 01-217 Warsaw'],
    prices: [40, 90],
    organizer: 'Club Kiss',
    discountPrices: [30, 80],
    updates: [
      Update(
        id: 1,
        date: DateTime(2019, 8, 14),
        contents: 'Customers that are searching for a particular topic. '
            'What\'s great about them is that you only have to lookup one '
            'topic and you\'ll get a list of all the related topics.',
      ),
      Update(
        id: 1,
        date: DateTime(2019, 8, 14),
        contents: 'Customers that are searching for a particular topic. '
            'What\'s great about them is that you only have to lookup one '
            'topic and you\'ll get a list of all the related topics.',
      ),
    ],
  ),
];

List<Filter> filters = [
  Filter(
    id: 1,
    color: AppColors.red,
    image: AssetImages.yourAreaIcon,
    name: 'Your Area'.toUpperCase(),
  ),
  Filter(
    id: 2,
    color: AppColors.blue,
    image: AssetImages.musicIcon,
    name: 'Music'.toUpperCase(),
  ),
  Filter(
    id: 3,
    color: AppColors.orange,
    image: AssetImages.sportsIcon,
    name: 'Sports'.toUpperCase(),
  ),
];