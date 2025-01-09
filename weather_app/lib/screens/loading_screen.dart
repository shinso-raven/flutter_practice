import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherapp/screens/location_screen.dart';
import 'package:weatherapp/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    final location = Location();
    await location.getCurrentPosition();

    print("Location");
    print(location.latitude);
    print(location.longitude);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        location: location,
      );
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitWaveSpinner(
        color: Colors.red,
        size: 150.0,
      )),
    );
  }
}
