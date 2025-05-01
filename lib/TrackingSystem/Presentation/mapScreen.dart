import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Application/trackingSystemFunctions.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  Set<Marker> marker= {};
  final LatLng _center = const LatLng(45.521563, -122.677433);
  trackingSystem trackingSys = trackingSystem();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Your Map'),
          elevation: 2,
        ),
        body: GoogleMap(
          myLocationButtonEnabled: false,
          markers: marker,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () async{
            Position position = await trackingSys.currentPosition();
            mapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                zoom: 14,
                target: LatLng(position.latitude,position.longitude),
              ),
            ),
            );
            marker.clear();
            marker.add(
              Marker(markerId: MarkerId("your location"),
              position: LatLng(position.latitude,position.longitude),)
            );
            setState(() {

            });
          },
          child: const Icon(Icons.my_location, size: 30,),
        ),
      ),
    );
  }
}
