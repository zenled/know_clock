import 'package:common/common.dart';

@immutable
class Color {
  Color(this.value) {
    _throwIfInvalidConstructorArgument(value);
  }

  final int value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Color &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    final hex = value.toRadixString(16).padRight(6, '0').toUpperCase();
    return 'ComponentColor{0x$hex}';
  }

  void _throwIfInvalidConstructorArgument(int colorValue) {
    if (!_isColorValid(colorValue)) {
      throw ArgumentError.value(colorValue);
    }
  }

  bool _isColorValid(int color) {
    return color >= 0 && color <= 0xFFFFFF;
  }
}
