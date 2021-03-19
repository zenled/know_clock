import 'package:common/common.dart';

@immutable
class ComponentColor {
  ComponentColor(this.color) {
    _throwIfInvalidColor(color);
  }

  final int color;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComponentColor &&
          runtimeType == other.runtimeType &&
          color == other.color;

  @override
  int get hashCode => color.hashCode;

  @override
  String toString() {
    final hex = color.toRadixString(16).padRight(6, '0').toUpperCase();
    return 'ComponentColor{0x$hex}';
  }

  void _throwIfInvalidColor(int color) {
    if (!_isColorValid(color)) {
      throw ArgumentError.value(color, 'color');
    }
  }

  bool _isColorValid(int color) {
    return color >= 0 && color <= 0xFFFFFF;
  }
}
