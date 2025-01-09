import 'package:weatherapp/services/location.dart';
import 'package:weatherapp/services/networking.dart';

class WeatherModel {
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final String apiKey = '67d1c9926392dc5b0cf30505983addb0';

  Future<dynamic> getCityWeather(String cityName) async {
    String endpoint = '$baseUrl?q=${cityName}&appid=${apiKey}';
    print(endpoint);
    Networking networking = Networking(url: endpoint);
    var weatherData = await networking.getData();
    return weatherData;
  }

  Future<dynamic> getWeatherData(Location location) async {
    print("getWeatherData");
    String endpoint = "texto";

    try {
      endpoint =
          '$baseUrl?lat=${location.latitude}&lon=${location.longitude}&appid=${apiKey}&units=metric';
      print(endpoint);
    } catch (e) {
      print("Boom");

      print(e);
    }
    print(endpoint);
    Networking networking = Networking(url: endpoint);
    var weatherData = await networking.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
