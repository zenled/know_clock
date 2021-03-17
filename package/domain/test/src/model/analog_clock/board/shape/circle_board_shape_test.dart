import 'package:domain/src/model/analog_clock/board/shape/circle_board_shape.dart';
import 'package:test/test.dart';

void main() {
  test('calling .toString produces a readable output', () {
    final shape = CircleBoardShape();
    expect(shape.toString(), 'CircleBoardShape{}');
  });
}
