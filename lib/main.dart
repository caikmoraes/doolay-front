import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}

//  "num_matricula": "41919297",
    // "password": "a1b2c3d4"
