import 'package:flutter/material.dart';
import 'package:ticket_app/domain/models/upcoming_events.dart';
import 'package:ticket_app/presentation/widgets/day_card.dart';
import 'package:ticket_app/presentation/widgets/upcoming_item.dart';

import '../../domain/constants.dart';
import 'dotted_line.dart';
import 'more_upcoming_item.dart';

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
    return Column(
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
                DottedLine(
                  height: upcomingEvents.events.length > 1
                      ? 5 * (dotRadius + dotSpacing)
                      : 3 * (dotRadius + dotSpacing),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Column(
                children: [
                  UpcomingItem(
                    upcoming: upcomingEvents.events[0],
                  ),
                  upcomingEvents.events.length > 1
                      ? Column(
                          children: [
                            const SizedBox(height: 16),
                            MoreUpcomingItem(
                              number: upcomingEvents.events.length - 1,
                              image: upcomingEvents.moreEventsImage!,
                            )
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
