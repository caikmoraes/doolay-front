import 'package:doolay_front/app/shared/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class UserStore extends NotifierStore<Exception, int> {
  UserStore() : super(0);

  Future saveNewUser(Map<String, dynamic> json, String profile) async {
    setLoading(true);
    try {
      UserRepository repo = Modular.get();
      Map<String, dynamic>? response = await repo.saveNewUser(json, profile);
      if (response != null) {
        update(1);
      } else {
        setError(Exception('Ops! Algo deu errado.'));
      }
    } catch (e) {
      debugPrint('$e');
      setError(Exception(e));
    } finally {
      setLoading(false);
    }
  }
}
