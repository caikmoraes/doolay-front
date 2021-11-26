import 'package:doolay_front/app/modules/history/history_page.dart';
import 'package:doolay_front/app/modules/history/history_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HistoryModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HistoryStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const HistoryPage()),
  ];
}
