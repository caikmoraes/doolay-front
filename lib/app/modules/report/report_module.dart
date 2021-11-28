import 'package:doolay_front/app/modules/report/report_page.dart';
import 'package:doolay_front/app/modules/report/report_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ReportModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ReportStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ReportPage()),
  ];
}
