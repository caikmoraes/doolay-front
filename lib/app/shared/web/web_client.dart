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
    final Map<String, String> mapHeaders = {
      "Access-Control-Allow-Origin": "*",
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
