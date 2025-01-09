import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class Networking {
  static Future getData(String url) async {
    // Await the http get response, then decode the json-formatted response.
    print("Requesting data...");
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}

class CoinApi {}
