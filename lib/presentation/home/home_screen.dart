import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket_app/domain/ext.dart';
import 'package:ticket_app/domain/models/upcoming_day_list.dart';
import 'package:ticket_app/presentation/styles/app_colors.dart';
import 'package:ticket_app/presentation/widgets/upcoming_day_item.dart';

import '../../domain/models/collection.dart';
import '../../domain/models/filter.dart';
import '../../domain/models/upcoming.dart';
import '../resources/asset_images.dart';
import '../widgets/collection_item.dart';
import '../widgets/dotted_line.dart';
import '../widgets/filter_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 45),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'For you',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AssetImages.filterIcon,
                ),
              ),
            ],
          ),
          const SizedBox(height: 79),
          Center(
            child: InkWell(
              onTap: () {},
              child: const Image(
                image: AssetImage(AssetImages.filters),
              ),
            ),
          ),
          const SizedBox(height: 111),
          Text(
            'Collections',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 25),
          SizedBox(
            height: 160,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowIndicator();
                return true;
              },
              child: ListView.separated(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: collections.length,
                itemBuilder: (context, index) => SizedBox(
                  child: CollectionItem(
                    collection: collections[index],
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 16),
              ),
            ),
          ),
          const SizedBox(height: 55),
          Text(
            'Discover',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 15),
          Consumer(
            builder: (context, ref, child) => SizedBox(
              height: 60,
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return true;
                },
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => FilterItem(
                    filter: filters[index],
                    selected: ref.isSelected(index),
                    onTap: () => ref.setSelectedFilter(index),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  itemCount: filters.length,
                ),
              ),
            ),
          ),
          const SizedBox(height: 55),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AssetImages.locationIcon),
              const SizedBox(width: 8),
              Text(
                'Warsaw'.toUpperCase(),
                style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Upcoming',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              IconButton(
                icon: const Icon(
                  Icons.arrow_forward,
                  color: AppColors.red,
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 25),
          Text(
            'Sep'.toUpperCase(),
            style: const TextStyle(
              color: AppColors.red,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => UpcomingDayItem(
              date: upcomingDayItemList[index].date,
              dayUpcomingList: upcomingDayItemList[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: upcomingDayItemList.length,
          )
        ],
      ),
    );
  }
}

List<UpcomingDayList> upcomingDayItemList = [
  UpcomingDayList(
    upcomingList: [
      Upcoming(
        title: 'Brightlight Music Festival',
        genre: 'Indie Rock',
        price: 'Є40 - Є90',
        image: AssetImages.upcoming,
      ),
      Upcoming(
        title: 'Brightlight Music Festival',
        genre: 'Indie Rock',
        price: 'Є40 - Є90',
        image: AssetImages.upcoming,
      ),
      Upcoming(
        title: 'Brightlight Music Festival',
        genre: 'Indie Rock',
        price: 'Є40 - Є90',
        image: AssetImages.upcoming,
      ),
      Upcoming(
        title: 'Brightlight Music Festival',
        genre: 'Indie Rock',
        price: 'Є40 - Є90',
        image: AssetImages.upcoming,
      ),
    ],
    date: DateTime.now(),
    moreUpcomingImage: AssetImages.moreUpcoming,
  ),
  UpcomingDayList(
    upcomingList: [
      Upcoming(
        title: 'Brightlight Music Festival',
        genre: 'Indie Rock',
        price: 'Є40 - Є90',
        image: AssetImages.upcoming,
      ),
      Upcoming(
        title: 'Brightlight Music Festival',
        genre: 'Indie Rock',
        price: 'Є40 - Є90',
        image: AssetImages.upcoming,
      ),
    ],
    date: DateTime(2022, 7, 15),
    moreUpcomingImage: AssetImages.moreUpcoming,
  ),
];

List<Collection> collections = [
  Collection(
    title: 'Electronica Next Month',
    description: 'Electronica',
    image: AssetImages.collection,
    genre: 'Electronica',
    date: 'Friday, 24 Aug 2019',
    time: '6:30PM - 9:30PM',
    location: ['Daboi Concert Hall', '5/7 Kolejowa, 01-217 Warsaw'],
    prices: [40, 90],
    organizer: 'Club Kiss',
    discountPrices: [30, 80],
  ),
  Collection(
    title: 'Electronica Next Month',
    description: 'Electronica',
    image: AssetImages.collection,
    genre: 'Electronica',
    date: 'Friday, 24 Aug 2019',
    time: '6:30PM - 9:30PM',
    location: ['Daboi Concert Hall', '5/7 Kolejowa, 01-217 Warsaw'],
    prices: [40, 90],
    organizer: 'Club Kiss',
    discountPrices: [30, 80],
  ),
];

List<Filter> filters = [
  Filter(
    color: AppColors.red,
    image: AssetImages.yourAreaIcon,
    name: 'Your Area'.toUpperCase(),
  ),
  Filter(
    color: AppColors.blue,
    image: AssetImages.musicIcon,
    name: 'Music'.toUpperCase(),
  ),
  Filter(
    color: AppColors.orange,
    image: AssetImages.sportsIcon,
    name: 'Sports'.toUpperCase(),
  ),
];
