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

  group('.isOperational tests', () {
    test('when instantiated, .isOperational is false', () {
      expect(tester.isOperational, false);
    });

    test('after initializing, .isOperational it true', () {
      tester.initStore();
      expect(tester.isOperational, true);
    });

    test('after disposing, .isOperational is false', () {
      tester.initStore();
      tester.disposeStore();
      expect(tester.isOperational, false);
    });
  });

  group('.ifOperational tests', () {
    test('callback is executed only if store is operational', () {
      bool wasExecuted;
      final maybeExecute = () => tester.ifOperational(() {
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
