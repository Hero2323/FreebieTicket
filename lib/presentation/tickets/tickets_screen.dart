import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_app/domain/ext.dart';
import 'package:ticket_app/presentation/styles/app_styles.dart';
import 'package:ticket_app/presentation/widgets/popular_searched_list.dart';
import 'package:ticket_app/presentation/widgets/ticket_item.dart';
import '../resources/asset_images.dart';
import '../styles/app_colors.dart';
import '../widgets/filter_item.dart';
import 'tickets_mock.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return true
        ? SafeArea(
            child: Material(
              color: AppColors.white,
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return true;
                },
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'My Tickets',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Consumer(
                        builder: (context, ref, child) => SizedBox(
                          height: 60,
                          child: NotificationListener<
                              OverscrollIndicatorNotification>(
                            onNotification: (overscroll) {
                              overscroll.disallowIndicator();
                              return true;
                            },
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(5),
                                child: FilterItem(
                                  filter: filters[index],
                                  selected: ref.isSelectedMyTickets(index),
                                  onTap: () =>
                                      ref.setSelectedMyTicketsFilter(index),
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 8),
                              itemCount: filters.length,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: events.length,
                        itemBuilder: (context, index) {
                          return TicketItem(
                            event: events[index],
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AssetImages.noTickets),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 100),
                        Text(
                          'Popular',
                          style: lightTicketsTitle,
                        ),
                        const SizedBox(height: 25),
                        SizedBox(
                          height: 40,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: popular.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.grey.withOpacity(0.5),
                                ),
                                height: 32,
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () {},
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                          popular[index],
                                          style: lightTicketsPopular,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 16);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'No Tickets Bought',
                            style: lightTicketsMidTitle,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'It appears you haven\'t bought any tickets yet. Maybe try searching these?',
                            textAlign: TextAlign.center,
                            style: lightTicketsSubtitle,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}

List<String> popular = [
  'Phil Collins',
  'TV on the Radio',
  'FC Barcelona',
];
