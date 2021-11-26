import 'package:doolay_front/app/modules/health/health_module.dart';
import 'package:doolay_front/app/modules/history/history_module.dart';
import 'package:doolay_front/app/modules/panel/panel_page.dart';
import 'package:doolay_front/app/modules/panel/panel_store.dart';
import 'package:doolay_front/app/modules/sintomas/sintomas_store.dart';
import 'package:doolay_front/app/modules/user/user_module.dart';
import 'package:doolay_front/app/shared/model/user_model.dart';
import 'package:doolay_front/app/shared/repositories/health_state_repository.dart';
import 'package:doolay_front/app/shared/repositories/sintomas_repository.dart';
import 'package:doolay_front/app/shared/repositories/user_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PanelModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PanelStore()),
    Bind.factory((i) => UserRepository()),
    Bind.factory((i) => SintomasStore()),
    Bind.factory((i) => SintomasRepository()),
    Bind.factory((i) => HealthStateRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => const PanelPage(),
    ),
    ModuleRoute('/user', module: UserModule()),
    ModuleRoute('/health', module: HealthModule()),
    ModuleRoute('/history', module: HistoryModule()),
  ];
}
