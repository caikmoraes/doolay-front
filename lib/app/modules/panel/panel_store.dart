import 'package:doolay_front/app/shared/model/user_model.dart';
import 'package:doolay_front/app/shared/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class PanelStore extends StreamStore<Exception, UserModel> {
  PanelStore() : super(UserModel());

  Future<UserModel?> fetchUserDetails() async {
    setLoading(true);
    try {
      UserRepository repo = Modular.get();
      UserModel? model = await repo.fetchUserDetails();
      if(model == null) {
        setLoading(false);
        Modular.to.pushReplacementNamed('/auth');
      } else {
        update(model);
      }
    } catch (e) {
      debugPrint('$e');
    } finally {
      setLoading(false);
    }
    return null;
  }

  String? getUser() => state.numIdentificacao;

  String? getTipoUsuario() => state.tipoUsuario;
}
