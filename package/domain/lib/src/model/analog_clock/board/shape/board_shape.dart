import 'package:common/common.dart';
import 'package:domain/domain.dart';

@immutable
abstract class BoardShape {
  T map<T>({
    required T Function(CircleBoardShape) circle,
    required T Function(SquareBoardShape) square,
  }) {
    final shape = this;
    if (shape is CircleBoardShape) {
      return circle(shape);
    }
    if (shape is SquareBoardShape) {
      return square(shape);
    }
    throw Error();
  }
}
