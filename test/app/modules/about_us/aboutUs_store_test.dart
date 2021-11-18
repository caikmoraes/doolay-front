import 'package:flutter_test/flutter_test.dart';
import 'package:doolay_front/app/modules/about_us/about_us_store.dart';
 
void main() {
  late AboutUsStore store;

  setUpAll(() {
    store = AboutUsStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}