import 'package:common/common.dart';

@immutable
class Time {
  static const minHour = 0;
  static const maxHour = 23;

  static const minMinute = 0;
  static const maxMinute = 59;

  static const minSecond = 0;
  static const maxSecond = 59;

  static const hoursInDay = 24;
  static const minutesInHour = 60;
  static const secondsInMinute = 60;

  Time([this.hour = 0, this.minute = 0, this.second = 0]) {
    _throwIfInvalidConstructorArguments(hour, minute, second);
  }

  final int hour;
  final int minute;
  final int second;

  Time add({int hour: 0, int minute: 0, int second: 0}) {
    final calculatedSecond = this.second + second;
    final newSecond = calculatedSecond % secondsInMinute;
    final secondOverflow = (calculatedSecond ~/ secondsInMinute) +
        (calculatedSecond.isNegative ? -1 : 0);

    final calculatedMinute = this.minute + minute + secondOverflow;
    final newMinute = calculatedMinute % minutesInHour;
    final minuteOverflow = (calculatedMinute ~/ minutesInHour) +
        (calculatedMinute.isNegative ? -1 : 0);

    final hourChange = this.hour + hour + minuteOverflow;
    final newHour = hourChange % hoursInDay;

    return Time(newHour, newMinute, newSecond);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Time &&
          runtimeType == other.runtimeType &&
          hour == other.hour &&
          minute == other.minute &&
          second == other.second;

  @override
  int get hashCode => hash3(hour, minute, second);

  @override
  String toString() {
    final hh = hour.toString().padLeft(2, '0');
    final mm = minute.toString().padLeft(2, '0');
    final ss = second.toString().padLeft(2, '0');
    return 'Time{$hh:$mm:$ss}';
  }

  operator +(Time other) {
    return add(hour: other.hour, minute: other.minute, second: other.second);
  }

  operator -(Time other) {
    return add(hour: -other.hour, minute: -other.minute, second: -other.second);
  }

  static bool isHourValid(int hour) {
    return (hour >= minHour) && (hour <= maxHour);
  }

  static bool isMinuteValid(int minute) {
    return (minute >= minMinute) && (minute <= maxMinute);
  }

  static bool isSecondValid(int second) {
    return (second >= minSecond) && (second <= maxSecond);
  }

  static void _throwIfInvalidConstructorArguments(
      int hour, int minute, second) {
    if (!isHourValid(hour)) {
      throw ArgumentError.value(hour, 'hour');
    }
    if (!isMinuteValid(minute)) {
      throw ArgumentError.value(minute, 'minute');
    }
    if (!isSecondValid(second)) {
      throw ArgumentError.value(second, 'second');
    }
  }
}
