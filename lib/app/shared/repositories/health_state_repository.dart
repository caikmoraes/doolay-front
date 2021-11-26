import 'dart:convert';
import 'dart:developer';

import 'package:doolay_front/app/shared/model/symptoms.dart';
import 'package:doolay_front/app/shared/model/user_health_state.dart';
import 'package:doolay_front/app/shared/web/web_client.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HealthStateRepository {
  WebClient client = Modular.get();

  Future<UserHealthState> saveHealthState(Map<String,dynamic> data) async {
    debugger();
    var path = 'saude/estadosaude/';
    var response = await client.executePost(path: path, json: data);
    var json = jsonDecode(response.body);
    return UserHealthState.fromJson(json);
  }

  Future<ItemSymptom> saveItemHealthState(Map<String, dynamic> data) async {
    var path = 'saude/item_sintoma/';
    var response = await client.executePost(path: path, json: data);
    var json = jsonDecode(response.body);
    return ItemSymptom.fromJson(json);
  }
}