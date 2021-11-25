import 'package:doolay_front/app/shared/model/new_user.dart';
import 'package:doolay_front/app/shared/repositories/setor_repository.dart';
import 'package:doolay_front/app/shared/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class UserStore extends NotifierStore<Exception, NewUser> {
  UserStore() : super(NewUser());

  Future saveNewUser(Map<String, dynamic> json) async {
    setLoading(true);
    try {
      UserRepository repo = Modular.get();
      NewUser? newUser = await repo.saveNewUser(json);
      update(newUser!);
    } catch (e) {
      debugPrint('$e');
      setError(Exception(e));
    } finally {
      setLoading(false);
    }
  }

  Future<List<Setor>?> fetchSetores() async {
    SetorRepository repo = Modular.get();
    List<Setor>? setores = await repo.fetchAll();
    return setores;
  }
}

class Setor {
  int? id;
  String? nome;

  Setor({this.id, this.nome});

  Setor.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json['id']);
    nome = json['nome'];
  }

  static List<Setor> fromJsonToList(List<dynamic> json) {
    List<Setor> list = [];
    for (var el in json) {
      list.add(
        Setor(id: el['id'], nome: el['nome']),
      );
    }
    return list;
  }
}
