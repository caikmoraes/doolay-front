import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WebClient {
  final baseUrl = 'https://doolay.herokuapp.com';

  Future<http.Response> executeGet(String path) async {
    var url = Uri.parse('$baseUrl/$path');
    var response = await http.get(url);
    return response;
  }

  Future<http.Response> executePost(
      String path, Map<String, dynamic> json) async {
    var url = Uri.parse('$baseUrl/$path');
    final Map<String, String> mapHeaders = {
      "Access-Control-Allow-Origin": "*", // Required for CORS support to work
      "Access-Control-Allow-Credentials":
          'true', // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    };
    var response = await http.post(
      url,
      body: json,
      headers: mapHeaders,
    );
    return response;
  }

  // Future<Response> executeDelete(String url) async {
  //   return Dio().delete('$baseUrl/$url');
  // }
}
