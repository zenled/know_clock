import 'package:domain/src/model/analog_clock/board/shape/square_board_shape.dart';
import 'package:test/test.dart';

void main() {
  test('has readable .toString', () {
    final shape = SquareBoardShape(radius: 1);
    expect(shape.toString(), 'SquareBoardShape{radius: 1.0}');
  });

  test('throws error when instantiated with an invalid radius', () {
    expect(() => SquareBoardShape(radius: -1), throwsArgumentError);
    expect(() => SquareBoardShape(radius: 101), throwsArgumentError);
  });
}
