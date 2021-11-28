import 'package:doolay_front/app/shared/exceptions/login_exception.dart';
import 'package:doolay_front/app/shared/repositories/user_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

class AuthStore extends NotifierStore<Exception, String> {
  AuthStore(String token) : super(token);

  Future<void> login(
      String tiaOrDrt, String password) async {
    setLoading(true);
    try {
      Map<String, dynamic> json = {
        'num_identificacao': tiaOrDrt,
        'password': password,
      };
      UserRepository repo = Modular.get();
      String? token = await repo.login(json);
      if (token != null) {
        update(token);
        Modular.to.pushReplacementNamed('/panel/');
      } else {
        setError(LoginException('Usuário ou senha incorretos'));
      }
    } catch (e) {
      setError(Exception(e));
    } finally {
      setLoading(false);
    }
  }

  String getToken() => state;
}
