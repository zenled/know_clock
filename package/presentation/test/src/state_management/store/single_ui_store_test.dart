import 'package:presentation/src/state_management/store/single_ui_store.dart';
import 'package:test/test.dart';

void main() {
  late _Tester tester;

  setUp(() {
    tester = _Tester();
  });

  test('.outUi emits only if Store is operational', () {
    tester.ui = 'emitted from instantiated';
    expect(tester.outUi.valueWrapper, isNull);

    tester.initStore();
    tester.ui = 'emitted form operational';
    expect(tester.outUi.valueWrapper!.value, 'emitted form operational');

    tester.disposeStore();
    tester.ui = 'emitted from disposed';
    expect(tester.outUi.valueWrapper!.value, 'emitted form operational');
  });
}

class _Tester extends SingleUiStore<String> {}
