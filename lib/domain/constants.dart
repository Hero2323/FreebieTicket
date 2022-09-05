import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const double dotRadius = 5;
const double dotSpacing = 15;

const String mapStyle =
    '[{"elementType":"geometry","stylers":[{"color":"#f5f5f5"}]},{"elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"elementType":"labels.text.fill","stylers":[{"color":"#616161"}]},{"elementType":"labels.text.stroke","stylers":[{"color":"#f5f5f5"}]},{"featureType":"administrative","elementType":"geometry","stylers":[{"visibility":"off"}]},{"featureType":"administrative.land_parcel","elementType":"labels.text.fill","stylers":[{"color":"#bdbdbd"}]},{"featureType":"poi","stylers":[{"visibility":"off"}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#eeeeee"}]},{"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#757575"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#e5e5e5"}]},{"featureType":"poi.park","elementType":"labels.text.fill","stylers":[{"color":"#9e9e9e"}]},{"featureType":"road","elementType":"geometry","stylers":[{"color":"#ffffff"}]},{"featureType":"road","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"road.arterial","elementType":"labels.text.fill","stylers":[{"color":"#757575"}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#dadada"}]},{"featureType":"road.highway","elementType":"labels.text.fill","stylers":[{"color":"#616161"}]},{"featureType":"road.local","elementType":"labels.text.fill","stylers":[{"color":"#9e9e9e"}]},{"featureType":"transit","stylers":[{"visibility":"off"}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"color":"#e5e5e5"}]},{"featureType":"transit.station","elementType":"geometry","stylers":[{"color":"#eeeeee"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#bbdefb"}]},{"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#bbdefb"}]}]';

const String mapStyle2 =
    '[{"featureType": "administrative.land_parcel","stylers": [{"visibility": "off"}]},{"featureType": "administrative.neighborhood","stylers": [{"visibility": "off"}]},{"featureType": "poi.business","stylers": [{"visibility": "off"}]},{"featureType": "poi.park","elementType": "labels.text","stylers": [{"visibility": "off"}]},{"featureType": "road","elementType": "labels","stylers": [{"visibility": "off"}]},{"featureType": "road.arterial","elementType": "labels","stylers": [{"visibility": "off"}]},{"featureType": "road.highway","elementType": "labels","stylers": [{"visibility": "off"}]},{"featureType": "road.local","stylers": [{"visibility": "off"}]},{"featureType":"water","elementType":"geometry","stylers":[{"color":"#bbdefb"}]}]}]';

final Completer<GoogleMapController> controller = Completer();

BitmapDescriptor? _createMarkerImageFromAsset(String iconPath) {
  ImageConfiguration configuration = const ImageConfiguration();
  BitmapDescriptor.fromAssetImage(configuration, iconPath).then((value) {
    return value;
  });
  return null;
}

//BitmapDescriptor.fromAssetImage(
//       ImageConfiguration(devicePixelRatio: 3.2),
//       "assets/images/markeruser.png",),

Future<BitmapDescriptor> _getAssetIcon(BuildContext context) async {
  final Completer<BitmapDescriptor> bitmapIcon = Completer<BitmapDescriptor>();
  final ImageConfiguration config = createLocalImageConfiguration(context);

  const AssetImage('assets/images/ticket.png')
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

// final Map<String, Marker> markers = {
//   '1': Marker(
//     markerId: const MarkerId('1'),
//     position: const LatLng(30.04443664782354, 31.235684551378952),
//     infoWindow: const InfoWindow(title: 'Hello marker 1', snippet: '*'),
//     icon: BitmapDescriptor.defaultMarkerWithHue(
//       BitmapDescriptor.hueGreen,
//     ),
//     // _createMarkerImageFromAsset("assets/images/ticket.png")!,
//     onTap: () {
//       // _onMarkerTapped(markerId);
//     },
//   ),
// };



const CameraPosition initialLocation = CameraPosition(
  target: LatLng(30.04443664782354, 31.235684551378952),
  zoom: 18,
);

void _add() {
  final Marker marker = Marker(
    markerId: const MarkerId('1'),
    position: const LatLng(30.04443664782354, 31.235684551378952),
    infoWindow: const InfoWindow(title: 'Hello marker 1', snippet: '*'),
    onTap: () {
      // _onMarkerTapped(markerId);
    },
  );

  // setState(() {
  // // adding a new marker to map
  // markers[markerId] = marker;
  // });
}
