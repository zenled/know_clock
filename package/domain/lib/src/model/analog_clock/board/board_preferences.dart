import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:domain/src/model/analog_clock/board/laminate/board_laminate.dart';

@immutable
class BoardPreferences {
  const BoardPreferences({
    required this.isVisible,
    required this.shape,
    required this.laminate,
  });

  final bool isVisible;

  final BoardShape shape;
  final BoardLaminate laminate;

  BoardPreferences copyWith({
    bool? isVisible,
    BoardShape? shape,
    BoardLaminate? laminate,
  }) {
    return BoardPreferences(
      isVisible: isVisible ?? this.isVisible,
      shape: shape ?? this.shape,
      laminate: laminate ?? this.laminate,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BoardPreferences &&
          runtimeType == other.runtimeType &&
          isVisible == other.isVisible &&
          shape == other.shape &&
          laminate == other.laminate;

  @override
  int get hashCode => isVisible.hashCode ^ shape.hashCode ^ laminate.hashCode;

  @override
  String toString() {
    return 'BoardPreferences{isVisible: $isVisible, ...}';
  }
}
