import 'dart:math';

import 'package:sudoku/engine/sudoku_solver.dart';
import 'package:sudoku/models/board.dart';
import 'package:sudoku/models/cell.dart';
import 'package:sudoku/models/difficulty.dart';

/// 一意解を持つ数独パズルを生成するジェネレーター
class SudokuGenerator {
  final Random _random;

  SudokuGenerator({Random? random}) : _random = random ?? Random();

  /// 指定難易度のパズルを生成し、Board を返す
  Board generate(Difficulty difficulty) {
    final solution = _generateFullBoard();
    final puzzle = _removeCells(solution, difficulty.removedCells);

    final cells = <List<Cell>>[];
    for (int r = 0; r < 9; r++) {
      final row = <Cell>[];
      for (int c = 0; c < 9; c++) {
        row.add(Cell(
          row: r,
          col: c,
          value: puzzle[r][c],
          isGiven: puzzle[r][c] != 0,
        ));
      }
      cells.add(row);
    }

    return Board(cells: cells, solution: solution);
  }

  /// 完全に埋まった有効な9x9盤面を生成
  List<List<int>> _generateFullBoard() {
    final grid = List.generate(9, (_) => List.filled(9, 0));

    // 対角の3つの3x3ボックスを独立にランダム充填
    for (int box = 0; box < 3; box++) {
      _fillBox(grid, box * 3, box * 3);
    }

    // 残りをバックトラッキングで埋める
    SudokuSolver.solve(grid);
    return grid;
  }

  /// 3x3 ボックスを 1-9 のランダム順列で埋める
  void _fillBox(List<List<int>> grid, int startRow, int startCol) {
    final numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]..shuffle(_random);
    int idx = 0;
    for (int r = startRow; r < startRow + 3; r++) {
      for (int c = startCol; c < startCol + 3; c++) {
        grid[r][c] = numbers[idx++];
      }
    }
  }

  /// 難易度に応じた数のセルを除去し、一意解を保証
  List<List<int>> _removeCells(List<List<int>> solution, int targetRemoval) {
    final puzzle = [for (final row in solution) [...row]];
    final positions = <(int, int)>[];
    for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 9; c++) {
        positions.add((r, c));
      }
    }
    positions.shuffle(_random);

    int removed = 0;
    for (final (r, c) in positions) {
      if (removed >= targetRemoval) break;

      final backup = puzzle[r][c];
      puzzle[r][c] = 0;

      final testGrid = [for (final row in puzzle) [...row]];
      if (SudokuSolver.countSolutions(testGrid, maxCount: 2) == 1) {
        removed++;
      } else {
        puzzle[r][c] = backup;
      }
    }

    return puzzle;
  }
}
