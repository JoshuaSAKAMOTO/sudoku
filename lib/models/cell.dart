import 'package:freezed_annotation/freezed_annotation.dart';

part 'cell.freezed.dart';
part 'cell.g.dart';

@freezed
abstract class Cell with _$Cell {
  const factory Cell({
    required int row,
    required int col,
    @Default(0) int value,
    @Default(false) bool isGiven,
    @Default({}) Set<int> memos,
    @Default(false) bool isError,
  }) = _Cell;

  factory Cell.fromJson(Map<String, dynamic> json) => _$CellFromJson(json);
}

@freezed
abstract class CellPosition with _$CellPosition {
  const factory CellPosition({
    required int row,
    required int col,
  }) = _CellPosition;

  factory CellPosition.fromJson(Map<String, dynamic> json) =>
      _$CellPositionFromJson(json);
}
