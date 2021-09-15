import 'dart:convert';

import 'package:http/http.dart' as http;

class RequestAssistant {
  static Future<dynamic> makeRequests(String url) async {
    try {
      final uri = Uri.parse(url);
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        String jsonData = response.body;
        var decodedData = jsonDecode(jsonData);
        return decodedData;
      } else {
        return 'failed';
      }
    } catch (e) {
      print(e.toString());
      return 'failed';
    }
  }
}

