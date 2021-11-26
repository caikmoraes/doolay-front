import 'package:doolay_front/app/modules/health/health_page.dart';
import 'package:doolay_front/app/modules/health/health_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HealthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HealthStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HealthPage()),
  ];
}
