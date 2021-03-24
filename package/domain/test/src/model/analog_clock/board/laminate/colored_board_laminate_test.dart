import 'package:domain/src/model/analog_clock/board/laminate/colored_board_laminate.dart';
import 'package:domain/src/model/styling/color.dart';
import 'package:test/test.dart';

void main() {
  test('has readable .toString', () {
    final laminate = ColoredBoardLaminate(Color(0xFFFFFF));
    expect(laminate.toString(), 'ColoredBoardLaminate{...}');
  });
}
