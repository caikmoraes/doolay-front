import 'package:flutter_test/flutter_test.dart';
import 'package:doolay_front/app/modules/covid/covid_store.dart';
 
void main() {
  late CovidStore store;

  setUpAll(() {
    store = CovidStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}