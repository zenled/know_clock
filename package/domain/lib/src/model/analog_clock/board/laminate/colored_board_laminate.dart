import 'package:domain/domain.dart';
import 'package:domain/src/model/analog_clock/board/laminate/board_laminate.dart';
import 'package:domain/src/model/styling/color.dart';

class ColoredBoardLaminate extends BoardLaminate {
  ColoredBoardLaminate(this.color);

  final Color color;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColoredBoardLaminate &&
          runtimeType == other.runtimeType &&
          color == other.color;

  @override
  int get hashCode => color.hashCode;

  @override
  String toString() {
    return 'ColoredBoardLaminate{...}';
  }
}
