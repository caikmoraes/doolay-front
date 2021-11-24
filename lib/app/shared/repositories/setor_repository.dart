import 'dart:convert';

import 'package:doolay_front/app/modules/user/user_store.dart';
import 'package:doolay_front/app/shared/web/web_client.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SetorRepository {
  WebClient client = Modular.get();
  Future<List<Setor>?> fetchAll() async {
    var path = 'setor';
    var response = await client.executeGet(path);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      List<Setor> list = Setor.fromJsonToList(json);
      return list;
    }
  }
}