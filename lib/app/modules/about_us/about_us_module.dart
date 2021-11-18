import 'package:doolay_front/app/modules/about_us/about_us_page.dart';
import 'package:doolay_front/app/modules/about_us/about_us_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AboutUsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AboutUsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const AboutUsPage()),
  ];
}
