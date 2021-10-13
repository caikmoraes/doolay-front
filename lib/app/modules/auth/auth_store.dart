import 'package:doolay_front/app/shared/enum/profile.dart';
import 'package:doolay_front/app/shared/exceptions/login_exception.dart';
import 'package:doolay_front/app/shared/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class AuthStore extends NotifierStore<Exception, String> {
  AuthStore() : super('');

  Future<void> login(
      String? tiaOrDrt, String? password, Profile? profile) async {
    setLoading(true);
    try {
      Map<String, dynamic> json = {
        'num_matricula': tiaOrDrt,
        'password': password,
      };
      String profilePath = profile == Profile.aluno ? 'alunos' : 'funcionarios';
      UserRepository repo = Modular.get();
      String? loggedUser = await repo.login(json, profilePath);
      if (loggedUser != null && loggedUser == 'OK') {
        update(loggedUser);
        Modular.to.navigate('/panel/', arguments: <String, dynamic>{
          'userId': json['num_matricula'],
          'profile': profilePath,
        });
      } else {
        setError(LoginException('Usuário ou senha incorretos'));
      }
    } catch (e) {
      setError(Exception(e));
    } finally {
      setLoading(false);
    }
  }
}
