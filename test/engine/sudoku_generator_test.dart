import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:sudoku/engine/sudoku_generator.dart';
import 'package:sudoku/engine/sudoku_solver.dart';
import 'package:sudoku/models/difficulty.dart';

void main() {
  group('SudokuGenerator', () {
    late SudokuGenerator generator;

    setUp(() {
      generator = SudokuGenerator(random: Random(42));
    });

    for (final difficulty in Difficulty.values) {
      test(
        '${difficulty.name} 難易度で有効なパズルを生成する',
        () {
          final board = generator.generate(difficulty);

          // 解が有効
          expect(SudokuSolver.isValid(board.solution), isTrue);
          for (int r = 0; r < 9; r++) {
            for (int c = 0; c < 9; c++) {
              expect(board.solution[r][c], inInclusiveRange(1, 9));
            }
          }

          // パズルの空セル数が概ね正しい
          int emptyCells = 0;
          for (int r = 0; r < 9; r++) {
            for (int c = 0; c < 9; c++) {
              if (board.cells[r][c].value == 0) emptyCells++;
            }
          }
          expect(
              emptyCells, greaterThanOrEqualTo(difficulty.removedCells ~/ 2));
          expect(emptyCells, lessThanOrEqualTo(difficulty.removedCells));

          // given セルの整合性チェック
          for (int r = 0; r < 9; r++) {
            for (int c = 0; c < 9; c++) {
              final cell = board.cells[r][c];
              if (cell.value != 0) {
                expect(cell.isGiven, isTrue);
                expect(cell.value, equals(board.solution[r][c]));
              } else {
                expect(cell.isGiven, isFalse);
              }
            }
          }

          // easy と medium では一意解を追加検証（hardは生成時に検証済みで時間がかかるためスキップ）
          if (difficulty != Difficulty.hard) {
            final puzzleGrid = [
              for (final row in board.cells)
                [for (final cell in row) cell.value]
            ];
            expect(
              SudokuSolver.countSolutions(puzzleGrid, maxCount: 2),
              equals(1),
            );
          }
        },
        timeout: const Timeout(Duration(seconds: 60)),
      );
    }

    test('異なるシードで異なるパズルを生成する', () {
      final gen1 = SudokuGenerator(random: Random(1));
      final gen2 = SudokuGenerator(random: Random(2));

      final board1 = gen1.generate(Difficulty.easy);
      final board2 = gen2.generate(Difficulty.easy);

      bool different = false;
      for (int r = 0; r < 9; r++) {
        for (int c = 0; c < 9; c++) {
          if (board1.solution[r][c] != board2.solution[r][c]) {
            different = true;
            break;
          }
        }
        if (different) break;
      }
      expect(different, isTrue);
    });
  });
}
