import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sudoku/engine/sudoku_generator.dart';
import 'package:sudoku/models/models.dart';
import 'package:sudoku/providers/game_notifier.dart';
import 'package:sudoku/repositories/game_repository.dart';

// テスト用のモックリポジトリ
class FakeGameRepository extends GameRepository {
  GameState? _savedState;
  bool _initialized = false;

  @override
  Future<void> init() async {
    _initialized = true;
  }

  @override
  Future<void> saveGame(GameState state) async {
    _savedState = state;
  }

  @override
  GameState? loadGame() => _savedState;

  @override
  Future<void> deleteGame() async {
    _savedState = null;
  }

  @override
  bool get hasSavedGame => _savedState != null;
}

ProviderContainer createContainer() {
  final repo = FakeGameRepository();
  return ProviderContainer(
    overrides: [
      gameRepositoryProvider.overrideWithValue(repo),
    ],
  );
}

Board createTestBoard() {
  return SudokuGenerator(random: Random(42)).generate(Difficulty.easy);
}

void main() {
  group('GameNotifier', () {
    test('初期状態は null', () {
      final container = createContainer();
      expect(container.read(gameNotifierProvider), isNull);
      container.dispose();
    });

    test('newGame で新しいゲームが作成される', () {
      final container = createContainer();
      container.read(gameNotifierProvider.notifier).newGame(Difficulty.easy);

      final state = container.read(gameNotifierProvider);
      expect(state, isNotNull);
      expect(state!.difficulty, Difficulty.easy);
      expect(state.isCompleted, isFalse);
      expect(state.hintsUsed, 0);
      expect(state.undoStack, isEmpty);
      expect(state.redoStack, isEmpty);
      container.dispose();
    });

    test('selectCell でセルを選択できる', () {
      final container = createContainer();
      container.read(gameNotifierProvider.notifier).newGame(Difficulty.easy);
      container.read(gameNotifierProvider.notifier).selectCell(0, 0);

      final state = container.read(gameNotifierProvider)!;
      expect(state.selectedCell, isNotNull);
      expect(state.selectedCell!.row, 0);
      expect(state.selectedCell!.col, 0);
      container.dispose();
    });

    test('同じセルを再選択で解除', () {
      final container = createContainer();
      container.read(gameNotifierProvider.notifier).newGame(Difficulty.easy);
      container.read(gameNotifierProvider.notifier).selectCell(0, 0);
      container.read(gameNotifierProvider.notifier).selectCell(0, 0);

      final state = container.read(gameNotifierProvider)!;
      expect(state.selectedCell, isNull);
      container.dispose();
    });

    test('setValue で値を設定できる', () {
      final container = createContainer();
      final notifier = container.read(gameNotifierProvider.notifier);
      notifier.newGame(Difficulty.easy);

      // 空セルを探す
      final state = container.read(gameNotifierProvider)!;
      int? emptyRow, emptyCol;
      for (int r = 0; r < 9 && emptyRow == null; r++) {
        for (int c = 0; c < 9 && emptyRow == null; c++) {
          if (!state.board.getCell(r, c).isGiven) {
            emptyRow = r;
            emptyCol = c;
          }
        }
      }

      expect(emptyRow, isNotNull);
      notifier.selectCell(emptyRow!, emptyCol!);
      final correctValue = state.board.solution[emptyRow][emptyCol!];
      notifier.setValue(correctValue);

      final updated = container.read(gameNotifierProvider)!;
      expect(updated.board.getCell(emptyRow, emptyCol).value, correctValue);
      expect(updated.board.getCell(emptyRow, emptyCol).isError, isFalse);
      expect(updated.undoStack, hasLength(1));
      container.dispose();
    });

    test('undo/redo が動作する', () {
      final container = createContainer();
      final notifier = container.read(gameNotifierProvider.notifier);
      notifier.newGame(Difficulty.easy);

      final state = container.read(gameNotifierProvider)!;
      int? emptyRow, emptyCol;
      for (int r = 0; r < 9 && emptyRow == null; r++) {
        for (int c = 0; c < 9 && emptyRow == null; c++) {
          if (!state.board.getCell(r, c).isGiven) {
            emptyRow = r;
            emptyCol = c;
          }
        }
      }

      notifier.selectCell(emptyRow!, emptyCol!);
      final correctValue = state.board.solution[emptyRow][emptyCol!];
      notifier.setValue(correctValue);

      // undo
      notifier.undo();
      var after = container.read(gameNotifierProvider)!;
      expect(after.board.getCell(emptyRow, emptyCol).value, 0);
      expect(after.redoStack, hasLength(1));

      // redo
      notifier.redo();
      after = container.read(gameNotifierProvider)!;
      expect(after.board.getCell(emptyRow, emptyCol).value, correctValue);
      expect(after.redoStack, isEmpty);
      container.dispose();
    });

    test('useHint でヒントが表示される', () {
      final container = createContainer();
      final notifier = container.read(gameNotifierProvider.notifier);
      notifier.newGame(Difficulty.easy);
      notifier.useHint();

      final state = container.read(gameNotifierProvider)!;
      expect(state.hintsUsed, 1);
      container.dispose();
    });

    test('given セルに setValue しても変更されない', () {
      final container = createContainer();
      final notifier = container.read(gameNotifierProvider.notifier);
      notifier.newGame(Difficulty.easy);

      final state = container.read(gameNotifierProvider)!;
      int? givenRow, givenCol;
      for (int r = 0; r < 9 && givenRow == null; r++) {
        for (int c = 0; c < 9 && givenRow == null; c++) {
          if (state.board.getCell(r, c).isGiven) {
            givenRow = r;
            givenCol = c;
          }
        }
      }

      final originalValue = state.board.getCell(givenRow!, givenCol!).value;
      notifier.selectCell(givenRow, givenCol);
      notifier.setValue(originalValue == 1 ? 2 : 1);

      final updated = container.read(gameNotifierProvider)!;
      expect(
          updated.board.getCell(givenRow, givenCol).value, originalValue);
      expect(updated.undoStack, isEmpty);
      container.dispose();
    });

    test('toggleMemo でメモを追加/削除できる', () {
      final container = createContainer();
      final notifier = container.read(gameNotifierProvider.notifier);
      notifier.newGame(Difficulty.easy);

      final state = container.read(gameNotifierProvider)!;
      int? emptyRow, emptyCol;
      for (int r = 0; r < 9 && emptyRow == null; r++) {
        for (int c = 0; c < 9 && emptyRow == null; c++) {
          if (!state.board.getCell(r, c).isGiven) {
            emptyRow = r;
            emptyCol = c;
          }
        }
      }

      notifier.selectCell(emptyRow!, emptyCol!);
      notifier.toggleMemo(5);

      var updated = container.read(gameNotifierProvider)!;
      expect(updated.board.getCell(emptyRow, emptyCol!).memos, contains(5));

      // 同じ数字でトグルオフ
      notifier.toggleMemo(5);
      updated = container.read(gameNotifierProvider)!;
      expect(
          updated.board.getCell(emptyRow, emptyCol).memos, isNot(contains(5)));
      container.dispose();
    });

    test('clearCell でセルをクリアできる', () {
      final container = createContainer();
      final notifier = container.read(gameNotifierProvider.notifier);
      notifier.newGame(Difficulty.easy);

      final state = container.read(gameNotifierProvider)!;
      int? emptyRow, emptyCol;
      for (int r = 0; r < 9 && emptyRow == null; r++) {
        for (int c = 0; c < 9 && emptyRow == null; c++) {
          if (!state.board.getCell(r, c).isGiven) {
            emptyRow = r;
            emptyCol = c;
          }
        }
      }

      notifier.selectCell(emptyRow!, emptyCol!);
      notifier.setValue(1);
      notifier.clearCell();

      final updated = container.read(gameNotifierProvider)!;
      expect(updated.board.getCell(emptyRow, emptyCol!).value, 0);
      container.dispose();
    });
  });
}
