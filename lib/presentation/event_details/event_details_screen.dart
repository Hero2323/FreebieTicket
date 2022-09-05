import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:ticket_app/domain/ext.dart';
import 'package:ticket_app/presentation/widgets/organizer_item.dart';
import '../../domain/models/event.dart';
import '../resources/asset_images.dart';
import '../styles/app_colors.dart';
import '../styles/app_styles.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;
  final ScrollController controller = ScrollController();
  final PageStorageBucket appBucket = PageStorageBucket();

  EventDetailsScreen({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          controller: controller,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AssetImages.eventDetails),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.black,
                          AppColors.black.withOpacity(0.1),
                          AppColors.black.withOpacity(0.0),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                color: AppColors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event.title,
                            style: lightTicketDetailsTitle,
                          ),
                          const SizedBox(height: 24),
                          NotificationListener<OverscrollIndicatorNotification>(
                            onNotification: (overscroll) {
                              overscroll.disallowIndicator();
                              return false;
                            },
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.date_range,
                                    color: AppColors.white,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    event.date,
                                    style: lightTicketDetailsSubTitle,
                                  ),
                                  const SizedBox(width: 14),
                                  Container(
                                    width: 4,
                                    height: 4,
                                    decoration: const BoxDecoration(
                                      color: AppColors.white,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    event.time,
                                    style: lightTicketDetailsSubTitle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: AppColors.white,
                              ),
                              const SizedBox(width: 12),
                              Column(children: [
                                Text(
                                  event.location[0],
                                  style: lightTicketDetailsSubTitle,
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  event.location[1],
                                  style: lightTicketDetailsMinorText,
                                ),
                              ]),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                AssetImages.musicIcon,
                                color: AppColors.white,
                                height: 16,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                event.genre,
                                style: lightTicketDetailsSubTitle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Image(
                                image: AssetImage(AssetImages.ticketsActive),
                                color: AppColors.white,
                                height: 16,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Є${event.prices[0]} - ${event.prices[event.prices.length - 1]}',
                                style: lightTicketDetailsSubTitle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Image(
                                image: AssetImage(AssetImages.organizer),
                                color: AppColors.white,
                                height: 16,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                event.organizer.name,
                                style: lightTicketDetailsSubTitle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 26,
                      ),
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Details',
                            style: lightTicketDetailsWhitePartTitle,
                          ),
                          const SizedBox(height: 8),
                          Consumer(
                            builder: (context, ref, child) => Text(
                              event.details,
                              style: lightTicketsSubtitle,
                              textAlign: TextAlign.justify,
                              maxLines: ref.showMore ? null : 2,
                              overflow:
                                  ref.showMore ? null : TextOverflow.ellipsis,
                            ),
                          ),
                          Consumer(
                            builder: (context, ref, child) => TextButton(
                              onPressed: () => ref.toggleShowMore(),
                              child: Text(
                                ref.showMore ? 'Show Less' : 'Show more',
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: AppColors.red,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Updates',
                                style: lightTicketDetailsWhitePartTitle,
                              ),
                              Consumer(
                                builder: (context, ref, child) => Material(
                                  color: AppColors.transparent,
                                  child: InkWell(
                                    onTap: () => ref.toggleUpdateNotification(),
                                    child: Icon(
                                      ref.updateNotification
                                          ? Icons.notifications_active
                                          : Icons.notifications_none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          event.updates != null
                              ? Consumer(
                                  builder: (context, ref, child) =>
                                      ListView.separated(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) => Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          DateFormat('MMMM d, yyyy').format(
                                              event.updates![index].date),
                                          style: TextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          event.updates![index].contents,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color: AppColors.grey,
                                          ),
                                          textAlign: TextAlign.justify,
                                          maxLines:
                                              ref.updatesReadMore ? null : 2,
                                          overflow: ref.updatesReadMore
                                              ? null
                                              : TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 16),
                                        if (index == 0 && !ref.updatesReadMore)
                                          TextButton(
                                            onPressed: () =>
                                                ref.toggleUpdatesReadMore(),
                                            child: const Text(
                                              'Show more',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: AppColors.red,
                                              ),
                                            ),
                                          ),
                                        if (index ==
                                                event.updates!.length - 1 &&
                                            ref.updatesReadMore)
                                          TextButton(
                                            onPressed: () =>
                                                ref.toggleUpdatesReadMore(),
                                            child: const Text(
                                              'Show less',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: AppColors.red,
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 10),
                                    itemCount: ref.updatesReadMore
                                        ? event.updates!.length
                                        : 1,
                                  ),
                                )
                              : const Center(child: Text('No updates yet')),
                          const SizedBox(height: 40),
                          Text(
                            'Location',
                            style: lightTicketDetailsWhitePartTitle,
                          ),
                          const SizedBox(height: 16),
                          const Image(
                            image: AssetImage(AssetImages.locationMock),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            event.location[0],
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.black.withOpacity(0.75),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            event.location[1],
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.black.withOpacity(0.6),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Text(
                            'Organizers',
                            style: lightTicketDetailsWhitePartTitle,
                          ),
                          const SizedBox(height: 24),
                          OrganizerItem(organizer: event.organizer),
                          const SizedBox(height: 30),
                          Container(
                            color: AppColors.grey,
                            height: 1,
                            width: double.infinity,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Є${event.prices[0]} - Є${event.prices[event.prices.length - 1]}',
                                    style: const TextStyle(
                                      color: AppColors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    event.title,
                                    style: const TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(AppColors.red),
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          horizontal: 32)),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'Buy Tickets',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
