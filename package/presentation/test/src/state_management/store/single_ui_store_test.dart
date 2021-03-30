import 'package:presentation/src/state_management/store/single_ui_store.dart';
import 'package:test/test.dart';

void main() {
  late _Tester tester;

  setUp(() {
    tester = _Tester();
  });

  test('.outUi emits only if Store is mounted', () {
    tester.ui = 'emitted from instantiated';
    expect(tester.outUi.valueWrapper, isNull);

    tester.initStore();
    tester.ui = 'emitted form initialized';
    expect(tester.outUi.valueWrapper!.value, 'emitted form initialized');

    tester.disposeStore();
    tester.ui = 'emitted from disposed';
    expect(tester.outUi.valueWrapper!.value, 'emitted form initialized');
  });
}

class _Tester extends SingleUiStore<String> {}
