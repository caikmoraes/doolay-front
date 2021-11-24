import 'package:doolay_front/app/modules/panel/panel_page.dart';
import 'package:doolay_front/app/modules/panel/panel_store.dart';
import 'package:doolay_front/app/modules/user/user_module.dart';
import 'package:doolay_front/app/shared/model/user_model.dart';
import 'package:doolay_front/app/shared/repositories/user_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PanelModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => UserRepository()),
    Bind.singleton((i) => User()),
    Bind.factory((i) => PanelStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const PanelPage(),
    ),
    ModuleRoute('/user', module: UserModule()),
  ];
}
