import 'package:domain/src/model/analog_clock/board/shape/square_board_shape.dart';
import 'package:test/test.dart';

void main() {
  test('calling. toString produces a readable output', () {
    final shape = SquareBoardShape(radius: 1);
    expect(shape.toString(), 'SquareBoardShape{radius: 1.0}');
  });

  test('has .copyWith', () {
    final shape = SquareBoardShape(radius: 1);
    expect(shape.copyWith(radius: 2), SquareBoardShape(radius: 2));
  });

  test('throws argument error if radius is invalid', () {
    expect(() => SquareBoardShape(radius: -1), throwsArgumentError);
    expect(() => SquareBoardShape(radius: 101), throwsArgumentError);
  });
}
