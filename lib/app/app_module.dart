import 'package:doolay_front/app/modules/auth/auth_module.dart';
import 'package:doolay_front/app/modules/auth/auth_store.dart';
import 'package:doolay_front/app/modules/home/home_module.dart';
import 'package:doolay_front/app/modules/panel/panel_module.dart';
import 'package:doolay_front/app/shared/model/user_model.dart';
import 'package:doolay_front/app/shared/web/web_client.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => WebClient()),
    Bind.lazySingleton((i) => UserModel()),
    Bind.lazySingleton((i) => AuthStore())
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/auth/', module: AuthModule()),
    ModuleRoute('/panel/', module: PanelModule()),
  ];
}
