import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class Networking {
  static Future getData(String url) async {
    // Await the http get response, then decode the json-formatted response.
    final String _apiKey = "2d9f1cde-9e86-4adb-b462-6cb639d60d0e";
    print("Requesting data...");

    Map<String, String> headers = {"X-CoinAPI-Key": _apiKey};

    var response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}

class CoinApi {
  final String _urlBase = "https://rest.coinapi.io/v1/exchangerate/";

  Future<double> getExchangeRate(String currency, String bitocoin) async {
    var response = null;

    try {
      response = await Networking.getData(
          _urlBase + "${bitocoin.toUpperCase()}/${currency.toUpperCase()}");
    } catch (e) {
      print("Currency not found");
    }

    if (response["rate"] == null) return 0;

    double rate = response["rate"];

    return rate;
  }
}
