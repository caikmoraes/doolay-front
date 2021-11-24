import 'dart:convert';
import 'dart:io';

import 'package:doolay_front/app/modules/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class WebClient {

  final baseUrl = 'https://doolay.herokuapp.com';

  Future<http.Response> executeGet(String path) async {
    AuthStore store = Modular.get();
    String token = store.getToken();
    if(token.isEmpty) Modular.to.pushReplacementNamed('/auth');
    var url = Uri.parse('$baseUrl/$path');
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Token $token',
    });
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
