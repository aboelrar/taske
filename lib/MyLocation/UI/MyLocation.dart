import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyLocation extends StatefulWidget {
  double lat, lng;

  MyLocation(this.lat, this.lng);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyLocationState(MyLocation(lat, lng));
  }
}

class MyLocationState extends State<MyLocation> {
  MyLocationState(this.myLocation);

  List<Marker> map_list = List<Marker>(); //DEFINE MAP LIST
  MyLocation myLocation;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //ADD MARKER TO LIST
    map_list.add(Marker(
        markerId: MarkerId('myLocation'),
        position: LatLng(myLocation.lat, myLocation.lng)));
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: LatLng(myLocation.lat, myLocation.lng), zoom: 18.0),
          markers: Set.from(map_list),
        ),
      ),
    );
  }
}
