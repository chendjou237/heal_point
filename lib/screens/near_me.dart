import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:heal_point/utilities/utilities.dart';

import '../models/models.dart';

const initialCameraPosition = CameraPosition(
  target: LatLng(3.952814, 11.516845),
  zoom: 50.5,
);
Directions? info;

class NearMePage extends StatefulWidget {
  const NearMePage({Key? key}) : super(key: key);

  @override
  State<NearMePage> createState() => _NearMePageState();
}

late GoogleMapController googleMapController;

class _NearMePageState extends State<NearMePage> {
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

    // final directions = await DirectionsRepository().getDirections(
    //   origin: _origin.position,
    //   destination: pos,
    // );

    setState(() {
      // info = directions;
    });
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }
}
