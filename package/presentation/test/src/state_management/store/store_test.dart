import 'package:presentation/src/state_management/store/store.dart';
import 'package:test/test.dart';

void main() {
  late _Tester tester;

  setUp(() {
    tester = _Tester();
  });

  group('lifecycle tests', () {
    test('initializing multiple times, throws error', () {
      tester.initStore();
      expect(() => tester.initStore(), throwsStateError);
    });

    test('initializing after disposing, throws error', () {
      tester.initStore();
      tester.disposeStore();
      expect(() => tester.initStore(), throwsStateError);
    });

    test('disposing without initializing first, throws error', () {
      expect(() => tester.disposeStore(), throwsStateError);
    });

    test('disposing multiple times, throws error', () {
      tester.initStore();
      tester.disposeStore();
      expect(() => tester.disposeStore(), throwsStateError);
    });
  });

  group('.isMounted tests', () {
    test('when instantiated, .isMounted is false', () {
      expect(tester.isMounted, false);
    });

    test('after initializing, .isMounted it true', () {
      tester.initStore();
      expect(tester.isMounted, true);
    });

    test('after disposing, .isMounted is false', () {
      tester.initStore();
      tester.disposeStore();
      expect(tester.isMounted, false);
    });
  });

  group('.ifMounted tests', () {
    test('.ifMounted callback is executed only if store is mounted', () {
      bool wasExecuted;
      final maybeExecute = () => tester.ifMounted(() {
            wasExecuted = true;
          });

      wasExecuted = false;
      maybeExecute();
      expect(wasExecuted, false);

      wasExecuted = false;
      tester.initStore();
      maybeExecute();
      expect(wasExecuted, true);

      wasExecuted = false;
      tester.disposeStore();
      maybeExecute();
      expect(wasExecuted, false);
    });
  });
}

class _Tester extends Store {}
