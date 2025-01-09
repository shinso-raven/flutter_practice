import 'package:flutter/material.dart';
import 'package:weatherapp/screens/city_screen.dart';
import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/weather.dart';

import '../utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({super.key, required this.location});

  Location location;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String timeMessage = "It's 🍦 time in San Francisco!";
  String temperatureMessage = '32°';
  String weatherIcon = '☀️';
  WeatherModel weatherModel = WeatherModel();

  @override
  void initState() {
    super.initState();
    getWeatherForecast();
  }

  Future getWeatherForecast() async {
    // weatherModel.getWeatherData().then((data) {
    //   print(data);
    // });

    // Location location = Location();
    print("....");
    // await location.getCurrentPosition();
    // print("cough....");

    print(widget.location.latitude);
    print(widget.location.longitude);

    dynamic data = await weatherModel.getWeatherData(widget.location);
    print(data);
    FormatWeatherData(data);
  }

  void FormatWeatherData(Map<String, dynamic> data) {
    double temp = 0;
    int conditionId = 0;

    if (data["main"] != null) {
      temp = data["main"]["temp"];
    }

    if (data["weather"] != null) {
      conditionId = data["weather"][0]["id"];
    }

    String city = data["name"];

    this.temperatureMessage = "$temp°";
    this.timeMessage =
        "${this.weatherModel.getMessage(temp.round())} in $city!";
    this.weatherIcon = this.weatherModel.getWeatherIcon(conditionId);

    print("Weather Data");
    print("Temp: $temp --- ConditionId: $conditionId");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      //Update with location

                      // widget.location = Location();
                      // await widget.location.getCurrentPosition();

                      // print("Location");
                      // print(widget.location.latitude);
                      // print(widget.location.longitude);

                      await getWeatherForecast();
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var cityName = Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));

                      var value = await cityName;

                      if (value != null) {
                        //obtener la infomracion del clima a partir de la ciudad
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      this.temperatureMessage,
                      style: kTempTextStyle,
                    ),
                    Text(
                      this.weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  this.timeMessage,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
