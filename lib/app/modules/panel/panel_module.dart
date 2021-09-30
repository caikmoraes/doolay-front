import 'package:doolay_front/app/modules/panel/panel_page.dart';
import 'package:doolay_front/app/modules/panel/panel_store.dart';
import 'package:doolay_front/app/modules/user/user_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PanelModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PanelStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const PanelPage()),
    ModuleRoute('/user/', module: UserModule()),
  ];
}
