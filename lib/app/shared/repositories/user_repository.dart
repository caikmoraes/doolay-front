import 'dart:convert';
import 'dart:developer';

import 'package:doolay_front/app/shared/model/new_user.dart';
import 'package:doolay_front/app/shared/model/user_model.dart';
import 'package:doolay_front/app/shared/web/web_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';

class UserRepository {
  Future<String?> login(Map<String, dynamic> json) async {
    WebClient client = Modular.get();

    var path = 'auth/token/login/';
    try {
      Response response = await client.executePost(path: path, json: json);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        String? message = jsonResponse['auth_token'].toString();
        return message;
      }
    } catch (e) {
      debugPrint('$e');
    }
    return null;
  }

  Future<UserModel?> fetchUserDetails() async {
    WebClient client = Modular.get();
    var path = 'auth/users/me/';
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

  Future<NewUser?> saveNewUser(Map<String, dynamic> newUserJson) async {
    WebClient client = Modular.get();
    var path = 'auth/users/';
    try {
      debugger();
      Response response =
          await client.executePost(json: newUserJson, path: path);
      var json = jsonDecode(response.body);
      return NewUser.fromJson(json);
    } catch (e) {
      debugPrint('$e');
    }
  }
}
