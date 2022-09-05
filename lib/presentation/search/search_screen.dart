import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ticket_app/presentation/widgets/popular_searched_list.dart';

import '../../domain/constants.dart';
import '../styles/app_colors.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/search_bottom_sheet.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  addMarker(markerID, context, icon) {
    _getAssetIcon(context, icon).then(
      (BitmapDescriptor icon) {
        _setMarkerIcon(markerID, icon);
      },
    );
  }

  void _setMarkerIcon(String markerID, BitmapDescriptor assetIcon) {
    final Marker marker = markers[markerID]!;
    setState(() {
      markers[markerID] = marker.copyWith(
        iconParam: assetIcon,
      );
    });
  }

  Future<BitmapDescriptor> _getAssetIcon(BuildContext context, icon) async {
    final Completer<BitmapDescriptor> bitmapIcon =
        Completer<BitmapDescriptor>();
    final ImageConfiguration config = createLocalImageConfiguration(context);

    AssetImage(icon)
        .resolve(config)
        .addListener(ImageStreamListener((ImageInfo image, bool sync) async {
      final ByteData? bytes =
          await image.image.toByteData(format: ImageByteFormat.png);
      if (bytes == null) {
        bitmapIcon.completeError(Exception('Unable to encode icon'));
        return;
      }
      final BitmapDescriptor bitmap =
          BitmapDescriptor.fromBytes(bytes.buffer.asUint8List());
      bitmapIcon.complete(bitmap);
    }));

    return await bitmapIcon.future;
  }

  _onMarkerTapped(markerId) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        isScrollControlled: true,
        isDismissible: true,
        builder: (context) {
          return SearchBottomSheet();
        });
  }

  late final Map<String, Marker> markers = {
    '1': Marker(
      markerId: const MarkerId('1'),
      position: const LatLng(30.04443664782354, 31.235684551378952),
      onTap: () {
        _onMarkerTapped('1');
      },
    ),
    '2': Marker(
      markerId: const MarkerId('2'),
      position: const LatLng(30.04525851392157, 31.2354689118122),
      onTap: () {
        _onMarkerTapped('2');
      },
    ),
    '3': Marker(
      markerId: const MarkerId('3'),
      position: const LatLng(30.043367139528865, 31.235206718115393),
      onTap: () {
        _onMarkerTapped('3');
      },
    ),
    '4': Marker(
      markerId: const MarkerId('4'),
      position: const LatLng(30.044982915900537, 31.23656138554891),
      onTap: () {
        _onMarkerTapped('4');
      },
    ),
    '5': Marker(
      markerId: const MarkerId('5'),
      position: const LatLng(30.04460464285852, 31.234569961994566),
      onTap: () {
        _onMarkerTapped('5');
      },
    ),
  };

  addFakeMarkers(context) {
    addMarker('1', context, 'assets/images/music_marker.png');
    addMarker('2', context, 'assets/images/sport_marker.png');
    addMarker('3', context, 'assets/images/music_marker.png');
    addMarker('4', context, 'assets/images/sport_marker.png');
    addMarker('5', context, 'assets/images/music_marker.png');
  }

  @override
  Widget build(BuildContext context) {
    addFakeMarkers(context);

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
                        onPressed: () {},
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
