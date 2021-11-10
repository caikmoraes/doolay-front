import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:doolay_front/app/modules/covid/covid_module.dart';
 
void main() {
  setUpAll(() {
    initModule(CovidModule());
  });
}