import 'package:presentation/src/state_management/store/mixin/single_out_state_store.dart';
import 'package:presentation/src/state_management/store/store.dart';
import 'package:test/test.dart';

void main() {
  late _Tester tester;

  setUp(() {
    tester = _Tester();
  });

  test('.outState emits only if Store is mounted', () {
    tester.stateUi = 'emitted from instantiated';
    expect(tester.outState.valueWrapper, isNull);

    tester.initStore();
    tester.stateUi = 'emitted form initialized';
    expect(tester.outState.valueWrapper!.value, 'emitted form initialized');

    tester.disposeStore();
    tester.stateUi = 'emitted from disposed';
    expect(tester.outState.valueWrapper!.value, 'emitted form initialized');
  });
}

class _Tester extends Store with SingleOutStateStore<String> {}
