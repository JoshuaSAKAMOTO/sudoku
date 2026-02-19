import 'package:freezed_annotation/freezed_annotation.dart';
import 'cell.dart';

part 'board.freezed.dart';
part 'board.g.dart';

@freezed
abstract class Board with _$Board {
  const factory Board({
    required List<List<Cell>> cells,
    required List<List<int>> solution,
  }) = _Board;

  factory Board.fromJson(Map<String, dynamic> json) => _$BoardFromJson(json);
}

extension BoardX on Board {
  Cell getCell(int row, int col) => cells[row][col];

  Board updateCell(int row, int col, Cell cell) {
    final newCells = [
      for (int r = 0; r < 9; r++)
        [
          for (int c = 0; c < 9; c++)
            if (r == row && c == col) cell else cells[r][c],
        ],
    ];
    return copyWith(cells: newCells);
  }
}
