import 'package:doolay_front/app/modules/user/user_health_page.dart';
import 'package:doolay_front/app/modules/user/user_page.dart';
import 'package:doolay_front/app/modules/user/user_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => UserStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/new', child: (_, args) => const UserPage()),
  ];
}
