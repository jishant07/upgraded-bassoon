import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  var lat;
  var long;
  var locationData;
  Location location = Location();
  getLocation() async {
    locationData = await location.getLocation();
    this.setState(() {
      lat = locationData.latitude;
      long = locationData.longitude;
    });
  }
  @override
  void initState() {
    super.initState();
    getLocation();
    // location.onLocationChanged.listen((LocationData currentLocation) {
    //   print(currentLocation);
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Page"),
      ),
      body: Center(
        child: lat == null && long == null ? Text("Location Page reached"): Text("Latitude ${lat}  Logitude ${long}"),
      ),
    );
  }
}
