import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:heal_point/functions/functions.dart';
import 'package:heal_point/utilities/utilities.dart';

import '../models/models.dart';

const initialCameraPosition = CameraPosition(
  target: LatLng(37.773972, -122.431297),
  zoom: 11.5,
);
 Directions? info   ;

class NearMe extends StatefulWidget {
  const NearMe({Key? key}) : super(key: key);

  @override
  State<NearMe> createState() => _NearMeState();
}

late GoogleMapController googleMapController;

class _NearMeState extends State<NearMe> {
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
        GoogleMap(
          polylines: {
            if(info != null)
            Polyline(polylineId: const PolylineId('overview_polyline'),
            color: Colors.red,
            width: 5, 
            points: info!.polylinePoints.map((ref) => LatLng(ref.latitude, ref.longitude)).toList(),
            ),
          },
          markers: {
            _origin,
            _destination,
          },
          onMapCreated: (controller) => googleMapController = controller,
          initialCameraPosition: initialCameraPosition,
          myLocationEnabled: false,
          zoomControlsEnabled: false,
          onLongPress: _addMarker,
        ),
        if(info != null)
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
              boxShadow: [BoxShadow(
                color: Colors.black26,
                offset: Offset(0,2),
                blurRadius: 6.0,
              ),
              
              ],
            ),
          child: Text("${info!.totalDistance}, ${info?.totalDuration}",
            style: TextStyle(
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
