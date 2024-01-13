import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/screens/location_screen.dart';

const apiKey = '1347b2a2b7eabdf962cdfb56e640f615';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    // double? latitude;
    // double? longitude;
    //
    // Location location = Location();
    // await location.getCurrentLocation();
    //
    // latitude = 33.0;
    // longitude = -120.34;
    print('In GetLocationData method');
    NetworkHelper networkHelper = NetworkHelper(url:'https://datausa.io/api/data?drilldowns=Nation&measures=Population');

    var decodeData = await networkHelper.getData();
    //print(decodeData);
    
    Navigator.push((context), MaterialPageRoute(builder: (context) => LocationScreen(decodeData)));
}

  @override
  Widget build(BuildContext context) {
    getLocationData();
    return Scaffold(
      body: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      ),
    );
  }
}
