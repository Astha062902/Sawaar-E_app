import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'dart:async';
import 'dart:core';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  LatLng? pickLocation;
  loc.Location location = loc.Location();
  String? _address;

  final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController? newGoogleMapController;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(28.7072, 77.1806),
    zoom: 14.4746,
  );
  static final Marker _kGooglePlexMarker3 = Marker(
      markerId: MarkerId('_kGooglePlex3'),
      infoWindow: InfoWindow(title: 'User Location'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: LatLng(28.7075, 77.1809));
  static final Marker _kGooglePlexMarker = Marker(
      markerId: MarkerId('_kGooglePlex'),
      infoWindow: InfoWindow(
          title: 'Azadpur --> Ashok Vihar', snippet: 'Found Chaar Sawaari'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(28.7072, 77.1806));
  //static final CameraPosition _klake = CameraPosition(
  // bearing: 192.833490139799,
  // target: LatLng(28.6963,77.1819),
  //tilt: 59.440717697143555,
  // zoom: 19.5756,
  //);
  static final Marker _kGooglePlexMarker2 = Marker(
      markerId: MarkerId('_kGoogleLake'),
      infoWindow: InfoWindow(title: 'Driver Location'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
      position: LatLng(28.6963, 77.1819));
  static final Polyline _kPolyline = Polyline(
    polylineId: PolylineId('_kPolyLine'),
    points: [
      LatLng(28.6963, 77.1819),
      LatLng(28.7072, 77.1806),
    ],
    width: 5,
  );
  static final Polygon _kPolygon = Polygon(
    polygonId: PolygonId('_kPolygon'),
    points: [
      LatLng(28.6963, 77.1819),
      LatLng(28.7072, 77.1806),
      LatLng(28.6820, 77.1825),
      LatLng(28.7080, 77.1802),
    ],
    strokeWidth: 5,
    fillColor: Colors.transparent,
  );
  //GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  //double searchLocationContainerHeight = 220;
  // double waitingResponsefromDriverContainerHeight = 0;
  // double assignedDriverInfoContainerHeight = 0;

  Position? userCurrentPosition;
  //var geolocation = Geolocator();

  LocationPermission? _locationPermission;
  double bottomPaddingOfMap = 0;

  // List<LatLng> pLineCoordinatedList = [];
  //Set<Polyline> polyLineSet = {};

  Set<Marker> markerSet = {};
  Set<Circle> circleSet = {};

  //String userName="";

  bool openNavigationDrawer = true;
  bool activeNearbyDriverKeysLoaded = false;
  BitmapDescriptor? activeNearbyIcon;

  locateUserPosition() async {
    Position cPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    userCurrentPosition = cPosition;

    LatLng latLngPosition = const LatLng(28.7072, 77.1806);
    CameraPosition cameraPosition =
        CameraPosition(target: latLngPosition, zoom: 15);
    newGoogleMapController!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Map View'),
        ),
        //floatingActionButton: FloatingActionButton(
        // onPressed: _onFloatingActionButtonPressed,
        //  child: Icon(Icons.add),
        //),
        body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              initialCameraPosition: _kGooglePlex,
              polylines: {
                _kPolyline,
              },
              // polygons: {
              // _kPolygon,
              // },
              markers: {
                _kGooglePlexMarker,
                _kGooglePlexMarker3,
                _kGooglePlexMarker2
              },
              circles: circleSet,
              onMapCreated: (GoogleMapController controller) {
                _controllerGoogleMap.complete(controller);
                newGoogleMapController = controller;

                setState(() {});
                locateUserPosition();
              },
              onCameraMove: (CameraPosition? position) {
                if (pickLocation != position!.target) {
                  setState(() {
                    pickLocation = position.target;
                  });
                }
              },
              onCameraIdle: () {
                //getAddressFromLating();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onFloatingActionButtonPressed() {
    LatLng desiredLocation =
        LatLng(28.7072, 77.1806); // Replace with the desired location

    // Create a custom marker
    Marker marker = Marker(
      markerId: MarkerId(desiredLocation.toString()),
      position: desiredLocation,
      infoWindow: InfoWindow(
        title: 'Accept RIDE',
        snippet:
            'Your message here', // Replace with the message you want to display
      ),
    );

    setState(() {
      markerSet.add(marker); // Add the custom marker to the set of markers
    });

    // Move the camera to the desired location
    newGoogleMapController!
        .animateCamera(CameraUpdate.newLatLng(desiredLocation));
  }
  //Future<void> _gotoTheLake() async {
  //  final GoogleMapController controller = await _controllerGoogleMap.future;
  // controller.animateCamera(CameraUpdate.newCameraPosition(_klake));
  //}
}
