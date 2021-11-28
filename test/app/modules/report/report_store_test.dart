import 'package:flutter_test/flutter_test.dart';
import 'package:doolay_front/app/modules/report/report_store.dart';
 
void main() {
  late ReportStore store;

  setUpAll(() {
    store = ReportStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}