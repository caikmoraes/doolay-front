import 'package:doolay_front/app/modules/covid/covid_page.dart';
import 'package:doolay_front/app/modules/covid/covid_store.dart';
import 'package:doolay_front/app/modules/covid_cases/covid_cases_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CovidModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CovidStore()),
    Bind.factory((i) => CovidCasesStore(CovidRepository())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const CovidPage()),
  ];
}
