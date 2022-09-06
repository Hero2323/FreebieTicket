import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_app/domain/models/upcoming_events.dart';
import 'package:ticket_app/presentation/widgets/day_card.dart';
import 'package:ticket_app/presentation/widgets/upcoming_item.dart';

import '../../domain/constants.dart';
import 'dotted_line.dart';
import 'more_upcoming_item.dart';
import '../../domain/ext.dart';

class UpcomingEventsItem extends StatelessWidget {
  final DateTime date;
  final UpcomingEvents upcomingEvents;
  const UpcomingEventsItem({
    Key? key,
    required this.date,
    required this.upcomingEvents,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  DayCard(date: date),
                  const SizedBox(height: 8),
                  ref.showMoreUpcomingEvents[upcomingEvents.id - 1]
                      ? DottedLine(
                          height: (5 + 6 * (upcomingEvents.events.length - 1)) *
                              (dotRadius + dotSpacing))
                      : DottedLine(
                          height: upcomingEvents.events.length > 1
                              ? 5 * (dotRadius + dotSpacing)
                              : 3 * (dotRadius + dotSpacing),
                        ),
                ],
              ),
              const SizedBox(width: 16),
              Flexible(
                child: ref.showMoreUpcomingEvents[upcomingEvents.id - 1]
                    ? Column(
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => UpcomingItem(
                              upcoming: upcomingEvents.events[index],
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 16,
                            ),
                            itemCount: upcomingEvents.events.length,
                          ),
                          const SizedBox(height: 16),
                          MoreUpcomingItem(
                            upcomingId: upcomingEvents.id,
                            image: upcomingEvents.moreEventsImage!,
                            events: upcomingEvents.events
                                .sublist(1, upcomingEvents.events.length),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          UpcomingItem(
                            upcoming: upcomingEvents.events[0],
                          ),
                          upcomingEvents.events.length > 1
                              ? Column(
                                  children: [
                                    const SizedBox(height: 16),
                                    MoreUpcomingItem(
                                      upcomingId: upcomingEvents.id,
                                      image: upcomingEvents.moreEventsImage!,
                                      events: upcomingEvents.events.sublist(
                                          1, upcomingEvents.events.length),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                        ],
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
