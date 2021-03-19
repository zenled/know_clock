import 'package:domain/domain.dart';
import 'package:domain/src/model/analog_clock/board/laminate/board_laminate.dart';

class ColoredBoardLaminate extends BoardLaminate {
  ColoredBoardLaminate({required this.color});

  final ComponentColor color;

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
