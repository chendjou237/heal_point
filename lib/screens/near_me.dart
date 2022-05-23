
  import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:heal_point/functions/directions_repository.dart';
import 'package:heal_point/screens/screens.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utilities/utilities.dart';


class NearMePage extends ConsumerStatefulWidget {
  const NearMePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NearMePageState();
}

class _NearMePageState extends ConsumerState<NearMePage> {

 
final Marker _origin = Marker(
    markerId: const MarkerId("origin"),
    position: initialCameraPosition.target,
    infoWindow: const InfoWindow(title: "My Position"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
  );
  Marker _destination = const Marker(
    markerId: MarkerId("destination"),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 36.0),
          child: GoogleMap(
            mapType: MapType.hybrid,
            polylines: {
              if (info != null)
                Polyline(
                  polylineId: const PolylineId('overview_polyline'),
                  color: Colors.red,
                  width: 5,
                  points: info!.polylinePoints
                      .map((ref) => LatLng(ref.latitude, ref.longitude))
                      .toList(),
                ),
            },
            markers: {
              _origin,
              _destination,
            },
            onMapCreated: (controller) => googleMapController = controller,
            initialCameraPosition: initialCameraPosition,
            myLocationEnabled: true,
            zoomControlsEnabled: true,
            onLongPress: _addMarker,
          ),
        ),
        if (info != null)
          Positioned(
            top: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: secondaryColorLight,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Text(
                "${info!.totalDistance}, ${info?.totalDuration}",
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ],
    );
  }

  void _addMarker(LatLng pos) async {
    setState(() {
      _destination = Marker(
        markerId: const MarkerId("destination"),
        infoWindow: const InfoWindow(title: "destination"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: pos,
      );
    });

    final directions = await DirectionsRepository().getDirections(
      origin: _origin.position,
      destination: pos,
    );

    setState(() {
      info = directions;
    });
  }
}
