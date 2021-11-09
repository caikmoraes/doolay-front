import 'package:flutter_test/flutter_test.dart';
import 'package:doolay_front/app/modules/contact/contact_store.dart';
 
void main() {
  late ContactStore store;

  setUpAll(() {
    store = ContactStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}