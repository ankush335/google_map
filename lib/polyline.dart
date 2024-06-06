import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Polyline extends StatefulWidget {
  const Polyline({super.key});

  @override
  State<Polyline> createState() => _PolylineState();
}

class _PolylineState extends State<Polyline> {
  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(32.11677949536951, 76.24669452035697),
    zoom: 14,
  );


  List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(32.11677949536951, 76.24669452035697),
        infoWindow: InfoWindow(title: "KALKA")),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(32.099804, 76.269104),
        infoWindow: InfoWindow(title: "current position")),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        mapType: MapType.normal,
        myLocationEnabled: true,
        compassEnabled: true,
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
