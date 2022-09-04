import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ticket_app/presentation/widgets/popular_searched_list.dart';

import '../../domain/constants.dart';
import '../styles/app_colors.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/search_bottom_sheet.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: initialLocation,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            markers: markers.values.toSet(),
            onMapCreated: (GoogleMapController controller) {
              controller.setMapStyle(mapStyle);
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  AppColors.white,
                  AppColors.white.withOpacity(0.1),
                ])),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  hint: 'Event name, artist, place',
                  controller: TextEditingController(),
                  prefIcon: Icon(Icons.search,
                      color: AppColors.grey.withOpacity(0.5)),
                ),
                const SizedBox(height: 10),
                const PopularSearchedList(),
                Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16)),
                              isScrollControlled: true,
                              isDismissible: true,
                              builder: (context) {
                                return SearchBottomSheet();
                              });
                        },
                        icon: const Icon(
                          Icons.gps_fixed,
                          color: AppColors.red,
                        )))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
