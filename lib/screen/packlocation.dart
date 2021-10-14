import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class PackLocation extends StatefulWidget {
  const PackLocation({Key? key}) : super(key: key);

  @override
  _PackLocationState createState() => _PackLocationState();
}

class _PackLocationState extends State<PackLocation> {
  dynamic latitude;
  dynamic longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(location);
    print(location.latitude);
    print(location.longitude);

    setState(() {
      latitude = '${location.latitude}';
      longitude = '${location.longitude}';
    });

    //แปลงค่าละติจูตและลองติจูต เป็นสถานที่จริง
    var address = await placemarkFromCoordinates(9.006667, 99.901667);
    print(address);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Location"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ละติจูต ' + latitude,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(
                'ลองติจูต ' + longitude,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
