import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.72732592325358, 76.69896270883605),
    zoom: 14,
  );
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};
  List<LatLng> latlng = [
    LatLng(30.72732592325358, 76.69896270883605),
    LatLng(30.713370872934444, 76.71048339066792),
    LatLng(30.71264689411336, 76.7092923207156),
    LatLng(30.7110545073447, 76.71057555886703),
    LatLng(30.709808707958576, 76.70852441312337),
    LatLng(30.71056532057377, 76.70786439346827),
    LatLng(30.709991339133197, 76.70694643509738),
    LatLng(30.71052618558355, 76.70653676772505),
    LatLng(30.71032498111917, 76.70627983525578),
    LatLng(30.710223553134554, 76.70634544729492),
    //LatLng(30.71062924310045, 76.71282414976483),
  ];
  List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(30.72732592325358, 76.69896270883605),
        infoWindow: InfoWindow(title: 'Initial Point')),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(30.710223553134554, 76.70634544729492),
        infoWindow: InfoWindow(title: 'Destination Point')),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.addAll(_list);
    for (int i = 0; i < latlng.length; i++) {
      _markers.add(Marker(
          markerId: MarkerId(i.toString()),
          position: latlng[i],
          icon: BitmapDescriptor.defaultMarker));
      setState(() {});
      _polyline.add(Polyline(polylineId: PolylineId('1'), points: latlng));
      _marker = _list;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
        mapType: MapType.normal,
        myLocationEnabled: true,
        compassEnabled: true,
        polylines: _polyline,
        markers: Set<Marker>.of(_marker),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
