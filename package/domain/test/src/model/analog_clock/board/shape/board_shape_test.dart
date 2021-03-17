import 'package:domain/domain.dart';
import 'package:test/test.dart';

void main() {
  test('has .map', () {
    BoardShape shape = CircleBoardShape();
    expect(shape.map(circle: (_) => true, square: (_) => false), true);

    shape = SquareBoardShape(radius: 1);
    expect(shape.map(circle: (_) => false, square: (_) => true), true);
  });
}
