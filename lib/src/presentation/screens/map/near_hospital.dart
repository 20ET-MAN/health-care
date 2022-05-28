import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';
import 'package:healthcare/src/presentation/config/app_style.dart';
import 'package:healthcare/src/presentation/controller/maps_controller.dart';

class NearHospital extends StatefulWidget {
  const NearHospital({Key? key}) : super(key: key);

  @override
  State<NearHospital> createState() => _NearHospitalState();
}

class _NearHospitalState extends State<NearHospital> {
  late GoogleMapController googleMapController;
  static const CameraPosition initialCameraPosition = CameraPosition(
      target: LatLng(20.98509251723791, 105.79885345767255), zoom: 14);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bản đồ'),
        backgroundColor: AppColor.colorWhile,
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Position position = await MapsController().determinePosition();

          googleMapController.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 14)));

          markers.clear();

          markers.add(Marker(
              markerId: const MarkerId('currentLocation'),
              position: LatLng(position.latitude, position.longitude)));

          setState(() {
            markers;
          });
        },
        label: Text(
          'Vị trí của tôi',
          style: AppStyle().heading4.copyWith(color: AppColor.colorWhile),
        ),
        icon: const Icon(
          Icons.location_history,
          color: AppColor.colorWhile,
        ),
        backgroundColor: AppColor.colorOrange,
      ),
    );
  }
}
