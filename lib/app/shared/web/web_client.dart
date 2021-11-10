import 'dart:convert';

import 'package:http/http.dart' as http;

class WebClient {
  final baseUrl = 'https://doolay.herokuapp.com';

  Future<http.Response> executeGet(String path) async {
    var url = Uri.parse('$baseUrl/$path');
    var response = await http.get(url);
    return response;
  }

  Future<http.Response> executePost(
      {required String path, required Map<String, dynamic> json}) async {
    var url = Uri.parse('$baseUrl/$path');
    var response = await http.post(
      url,
      body: json,
    );
    return response;
  }

  Future<Map<String, dynamic>> fetchCovidCases(Uri url) async {
    var response = await http.get(url);
    return jsonDecode(response.body);
  }
}
