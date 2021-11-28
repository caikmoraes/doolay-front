import 'dart:convert';

import 'package:doolay_front/app/shared/model/symptoms.dart';
import 'package:doolay_front/app/shared/web/web_client.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SintomasRepository {
  Future<List<Symptoms>> fetchAll() async {
    WebClient client = Modular.get();
    var path = 'saude/sintomas/';
    var response = await client.executeGet(path);
    var json = jsonDecode(response.body);
    return Symptoms.fromJsonToList(json);
  }

  Future<Symptoms> save(Map<String, dynamic> data) async {
    WebClient client = Modular.get();
    var path = 'saude/sintomas/';
    var response = await client.executePost(path: path, json: data);
    var json = jsonDecode(response.body);
    return Symptoms.fromJson(json);
  }

  Future delete(int id) async {
    WebClient client = Modular.get();
    var path = 'saude/sintomas/$id/';
    await client.executeDelete(path: path);
  }

  Future<Symptoms> update(Map<String, dynamic> data, int id) async {
    WebClient client = Modular.get();
    var path = 'saude/sintomas/$id/';
    var response = await client.executePatch(path: path, json: data);
    var json = jsonDecode(response.body);
    return Symptoms.fromJson(json);
  }
}