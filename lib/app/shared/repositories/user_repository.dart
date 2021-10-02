import 'dart:convert';
import 'dart:developer';

import 'package:doolay_front/app/shared/model/user_model.dart';
import 'package:doolay_front/app/shared/web/web_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';

class UserRepository {
  Future<String?> login(Map<String, dynamic> json, String profilePath) async {
    WebClient client = Modular.get();

    var url = 'usuarios/$profilePath/login/';
    try {
      Response response = await client.executePost(path: url, json: json);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        String? message = jsonResponse['message'].toString();
        return message;
      }
    } catch (e) {
      debugPrint('$e');
    }
    return null;
  }

  Future<UserModel?> fetchUserDetails(String userId, String profile) async {
    WebClient client = Modular.get();
    var path = 'usuarios/$profile/$userId/';
    try {
      Response response = await client.executeGet(path);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        UserModel? model = UserModel.fromJson(json);
        return model;
      }
    } catch (e) {
      debugPrint('$e');
    }
    return null;
  }

  Future<Map<String, dynamic>?> saveNewUser(
      Map<String, dynamic> json, String profile) async {
    WebClient client = Modular.get();
    debugger();
    var path = 'usuarios/$profile/create/';
    try {
      Response response = await client.executePost(json: json, path: path);
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return json;
      }
    } catch (e) {
      debugPrint('$e');
    }
    return null;
  }
}
