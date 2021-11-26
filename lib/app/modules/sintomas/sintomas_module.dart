import 'package:doolay_front/app/modules/sintomas/sintomas_page.dart';
import 'package:doolay_front/app/modules/sintomas/sintomas_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SintomasModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SintomasStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SintomasPage()),
  ];
}
