import 'package:domain/src/model/analog_clock/board/shape/board_shape.dart';

class SquareBoardShape extends BoardShape {
  static const minRadius = 0.0;
  static const maxRadius = 100.0;

  SquareBoardShape({required this.radius}) {
    _throwIfInvalidRadius(radius);
  }

  final double radius;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SquareBoardShape &&
          runtimeType == other.runtimeType &&
          radius == other.radius;

  @override
  int get hashCode => radius.hashCode;

  @override
  String toString() {
    return 'SquareBoardShape{radius: $radius}';
  }

  void _throwIfInvalidRadius(double radius) {
    if (!_isRadiusValid(radius)) {
      throw ArgumentError.value(radius, 'radius');
    }
  }

  bool _isRadiusValid(double radius) {
    return radius >= minRadius && radius <= maxRadius;
  }
}
