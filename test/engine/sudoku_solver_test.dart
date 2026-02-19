import 'package:flutter_test/flutter_test.dart';
import 'package:sudoku/engine/sudoku_solver.dart';

void main() {
  group('SudokuSolver', () {
    test('空の盤面を解ける', () {
      final grid = List.generate(9, (_) => List.filled(9, 0));
      expect(SudokuSolver.solve(grid), isTrue);
      _expectValidSolution(grid);
    });

    test('部分的に埋まった盤面を解ける', () {
      final grid = [
        [5, 3, 0, 0, 7, 0, 0, 0, 0],
        [6, 0, 0, 1, 9, 5, 0, 0, 0],
        [0, 9, 8, 0, 0, 0, 0, 6, 0],
        [8, 0, 0, 0, 6, 0, 0, 0, 3],
        [4, 0, 0, 8, 0, 3, 0, 0, 1],
        [7, 0, 0, 0, 2, 0, 0, 0, 6],
        [0, 6, 0, 0, 0, 0, 2, 8, 0],
        [0, 0, 0, 4, 1, 9, 0, 0, 5],
        [0, 0, 0, 0, 8, 0, 0, 7, 9],
      ];
      expect(SudokuSolver.solve(grid), isTrue);
      _expectValidSolution(grid);
    });

    test('不正な盤面は解けない', () {
      final grid = List.generate(9, (_) => List.filled(9, 0));
      // 行に同じ数字を2つ配置（不正）
      grid[0][0] = 1;
      grid[0][1] = 1;
      expect(SudokuSolver.solve(grid), isFalse);
    });

    test('一意解の検証: 解が1つ', () {
      final grid = [
        [5, 3, 0, 0, 7, 0, 0, 0, 0],
        [6, 0, 0, 1, 9, 5, 0, 0, 0],
        [0, 9, 8, 0, 0, 0, 0, 6, 0],
        [8, 0, 0, 0, 6, 0, 0, 0, 3],
        [4, 0, 0, 8, 0, 3, 0, 0, 1],
        [7, 0, 0, 0, 2, 0, 0, 0, 6],
        [0, 6, 0, 0, 0, 0, 2, 8, 0],
        [0, 0, 0, 4, 1, 9, 0, 0, 5],
        [0, 0, 0, 0, 8, 0, 0, 7, 9],
      ];
      expect(SudokuSolver.countSolutions(grid, maxCount: 2), equals(1));
    });

    test('isValid: 有効な盤面', () {
      final grid = [
        [5, 3, 4, 6, 7, 8, 9, 1, 2],
        [6, 7, 2, 1, 9, 5, 3, 4, 8],
        [1, 9, 8, 3, 4, 2, 5, 6, 7],
        [8, 5, 9, 7, 6, 1, 4, 2, 3],
        [4, 2, 6, 8, 5, 3, 7, 9, 1],
        [7, 1, 3, 9, 2, 4, 8, 5, 6],
        [9, 6, 1, 5, 3, 7, 2, 8, 4],
        [2, 8, 7, 4, 1, 9, 6, 3, 5],
        [3, 4, 5, 2, 8, 6, 1, 7, 9],
      ];
      expect(SudokuSolver.isValid(grid), isTrue);
    });

    test('isValid: 行に重複がある盤面は無効', () {
      final grid = List.generate(9, (_) => List.filled(9, 0));
      grid[0][0] = 1;
      grid[0][1] = 1;
      expect(SudokuSolver.isValid(grid), isFalse);
    });

    test('getCandidates: 正しい候補を返す', () {
      final grid = [
        [5, 3, 0, 0, 7, 0, 0, 0, 0],
        [6, 0, 0, 1, 9, 5, 0, 0, 0],
        [0, 9, 8, 0, 0, 0, 0, 6, 0],
        [8, 0, 0, 0, 6, 0, 0, 0, 3],
        [4, 0, 0, 8, 0, 3, 0, 0, 1],
        [7, 0, 0, 0, 2, 0, 0, 0, 6],
        [0, 6, 0, 0, 0, 0, 2, 8, 0],
        [0, 0, 0, 4, 1, 9, 0, 0, 5],
        [0, 0, 0, 0, 8, 0, 0, 7, 9],
      ];
      final candidates = SudokuSolver.getCandidates(grid, 0, 2);
      // row 0: 5,3,7 -> missing 1,2,4,6,8,9
      // col 2: 8 -> also excluded
      // box(0,0): 5,3,6,9,8 -> also excluded
      expect(candidates, equals({1, 2, 4}));
    });
  });
}

void _expectValidSolution(List<List<int>> grid) {
  // すべてのセルが1-9
  for (int r = 0; r < 9; r++) {
    for (int c = 0; c < 9; c++) {
      expect(grid[r][c], inInclusiveRange(1, 9));
    }
  }
  expect(SudokuSolver.isValid(grid), isTrue);
}
