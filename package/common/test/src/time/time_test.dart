import 'package:common/src/time/time.dart';
import 'package:test/test.dart';

void main() {
  test('all dimensions have a default value of 0', () {
    final actual = Time();
    final matcher = Time(0, 0, 0);
    expect(actual, matcher);
  });

  test('calling .toString produces a readable output', () {
    final time = Time(1, 2, 3);

    final actual = time.toString();
    final matcher = 'Time{01:02:03}';
    expect(actual, matcher);
  });

  group('throwing errors when instantiating', () {
    test('throws error when instantiating with an invalid hour', () {
      expect(() => Time(24), throwsArgumentError);
    });

    test('throws error when instantiating with an invalid minute', () {
      expect(() => Time(1, 60), throwsArgumentError);
    });

    test('throws error when instantiating with an invalid second', () {
      expect(() => Time(1, 1, 60), throwsArgumentError);
    });
  });

  group('adding time', () {
    test('adding without specifying any dimensions returns original time', () {
      final original = Time(1, 2, 3);
      expect(original.add(), original);
    });

    test('can add hour, without overflowing', () {
      final actual = Time(1).add(hour: 1);
      final matcher = Time(2);
      expect(actual, matcher);
    });

    test(
      'can add hour, with top overflow',
      () {
        final actual = Time(23).add(hour: 1);
        final matcher = Time(0);
        expect(actual, matcher);
      },
    );

    test('can add hour, with bottom overflow', () {
      final time = Time(0);
      final actual = time.add(hour: -1);
      final matcher = Time(23);
      expect(actual, matcher);
    });
  });

  group('validation', () {
    test('validates an valid hour', () {
      expect(Time.isHourValid(1), true);
    });

    test('validates an invalid hour', () {
      expect(Time.isHourValid(-1), false);
      expect(Time.isHourValid(24), false);
    });

    test('validates an valid minute', () {
      expect(Time.isMinuteValid(1), true);
    });

    test('validates an invalid minute', () {
      expect(Time.isMinuteValid(-1), false);
      expect(Time.isMinuteValid(60), false);
    });

    test('validates an valid second', () {
      expect(Time.isSecondValid(1), true);
    });

    test('validates an invalid second', () {
      expect(Time.isSecondValid(-1), false);
      expect(Time.isSecondValid(60), false);
    });
  });
}
