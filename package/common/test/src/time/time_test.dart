import 'package:common/src/time/time.dart';
import 'package:test/test.dart';

void main() {
  test('all dimensions have a default value of 0', () {
    expect(Time(), Time(0, 0, 0));
  });

  test('calling .toString produces a readable output', () {
    expect(Time(1, 2, 3).toString(), 'Time{01:02:03}');
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

    test('can add hour', () {
      expect(Time(1).add(hour: 1), Time(2));
      expect(Time(23).add(hour: 1), Time(0));
      expect(Time(0).add(hour: -1), Time(23));

      expect(Time(13).add(hour: 71), Time(12));
      expect(Time(8).add(hour: -42), Time(14));
    });

    test('can add minute', () {
      expect(Time(0, 1).add(minute: 1), Time(0, 2));
      expect(Time(0, 59).add(minute: 1), Time(1, 0));
      expect(Time(1, 0).add(minute: -1), Time(0, 59));

      expect(Time(14, 50).add(minute: 161), Time(17, 31));
      expect(Time(21, 21).add(minute: -216), Time(17, 45));
    });

    test('can add second', () {
      expect(Time(0, 0, 1).add(second: 1), Time(0, 0, 2));
      expect(Time(0, 0, 59).add(second: 1), Time(0, 1, 0));
      expect(Time(0, 59, 59).add(second: 1), Time(1, 0, 0));
      expect(Time(0, 1, 0).add(second: -1), Time(0, 0, 59));
      expect(Time(1, 0, 0).add(second: -1), Time(0, 59, 59));

      expect(Time(12, 34, 56).add(second: 1761), Time(13, 4, 17));
      expect(Time(11, 12, 13).add(second: -2014), Time(10, 38, 39));
    });

    test('can add multiple dimensions', () {
      expect(
        Time(17, 18, 19).add(hour: 45, minute: 567, second: 789),
        Time(23, 58, 28),
      );
      expect(
        Time(11, 45, 56).add(hour: -435, minute: -376, second: -532),
        Time(2, 21, 4),
      );
      expect(
        Time(8, 9, 10).add(hour: 2, minute: -10, second: -12),
        Time(9, 58, 58),
      );
    });

    test('can add Time', () {
      expect(Time(0, 0, 0) + Time(1, 1, 1), Time(1, 1, 1));
      expect(Time(13, 14, 15) + Time(23, 51, 49), Time(13, 6, 4));
    });

    test('can subtract Time', () {
      expect(Time(1, 1, 1) - Time(1, 1, 1), Time(0, 0, 0));
      expect(Time(3, 4, 5) - Time(21, 58, 57), Time(5, 5, 8));
    });
  });

  group('validation', () {
    test('can validate hour', () {
      expect(Time.isHourValid(1), true);
      expect(Time.isHourValid(-1), false);
      expect(Time.isHourValid(24), false);
    });

    test('can validate minute', () {
      expect(Time.isMinuteValid(1), true);
      expect(Time.isMinuteValid(-1), false);
      expect(Time.isMinuteValid(60), false);
    });

    test('can validate second', () {
      expect(Time.isSecondValid(1), true);
      expect(Time.isSecondValid(-1), false);
      expect(Time.isSecondValid(60), false);
    });
  });
}
