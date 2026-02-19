import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sudoku/engine/sudoku_generator.dart';
import 'package:sudoku/models/models.dart';
import 'package:sudoku/repositories/game_repository.dart';
import 'package:uuid/uuid.dart';

final gameRepositoryProvider = Provider<GameRepository>((ref) {
  return GameRepository();
});

final gameNotifierProvider =
    NotifierProvider<GameNotifier, GameState?>(GameNotifier.new);

final hasSavedGameProvider = Provider<bool>((ref) {
  return ref.watch(gameRepositoryProvider).hasSavedGame;
});

class GameNotifier extends Notifier<GameState?> {
  @override
  GameState? build() => null;

  GameRepository get _repo => ref.read(gameRepositoryProvider);

  void newGame(Difficulty difficulty) {
    final generator = SudokuGenerator();
    final board = generator.generate(difficulty);
    state = GameState(
      id: const Uuid().v4(),
      board: board,
      difficulty: difficulty,
    );
  }

  void selectCell(int row, int col) {
    if (state == null) return;
    final current = state!.selectedCell;
    if (current != null && current.row == row && current.col == col) {
      state = state!.copyWith(selectedCell: null);
    } else {
      state = state!.copyWith(
        selectedCell: CellPosition(row: row, col: col),
      );
    }
  }

  void setValue(int number) {
    final s = state;
    if (s == null || s.selectedCell == null || s.isCompleted) return;

    final row = s.selectedCell!.row;
    final col = s.selectedCell!.col;
    final cell = s.board.getCell(row, col);

    if (cell.isGiven) return;

    final action = GameAction.setValue(
      row: row,
      col: col,
      previousValue: cell.value,
      newValue: number,
    );

    final isError = s.board.solution[row][col] != number;
    final newCell = cell.copyWith(
      value: number,
      memos: {},
      isError: isError,
    );
    final newBoard = s.board.updateCell(row, col, newCell);

    state = s.copyWith(
      board: newBoard,
      undoStack: [...s.undoStack, action],
      redoStack: [],
      isCompleted: _checkCompleted(newBoard),
    );
  }

  void toggleMemo(int number) {
    final s = state;
    if (s == null || s.selectedCell == null || s.isCompleted) return;

    final row = s.selectedCell!.row;
    final col = s.selectedCell!.col;
    final cell = s.board.getCell(row, col);

    if (cell.isGiven || cell.value != 0) return;

    final action = GameAction.toggleMemo(
      row: row,
      col: col,
      number: number,
    );

    final newMemos = Set<int>.from(cell.memos);
    if (newMemos.contains(number)) {
      newMemos.remove(number);
    } else {
      newMemos.add(number);
    }
    final newCell = cell.copyWith(memos: newMemos);
    final newBoard = s.board.updateCell(row, col, newCell);

    state = s.copyWith(
      board: newBoard,
      undoStack: [...s.undoStack, action],
      redoStack: [],
    );
  }

  void clearCell() {
    final s = state;
    if (s == null || s.selectedCell == null || s.isCompleted) return;

    final row = s.selectedCell!.row;
    final col = s.selectedCell!.col;
    final cell = s.board.getCell(row, col);

    if (cell.isGiven) return;
    if (cell.value == 0 && cell.memos.isEmpty) return;

    final action = GameAction.clearCell(
      row: row,
      col: col,
      previousValue: cell.value,
      previousMemos: cell.memos,
    );

    final newCell = cell.copyWith(value: 0, memos: {}, isError: false);
    final newBoard = s.board.updateCell(row, col, newCell);

    state = s.copyWith(
      board: newBoard,
      undoStack: [...s.undoStack, action],
      redoStack: [],
    );
  }

  void undo() {
    final s = state;
    if (s == null || s.undoStack.isEmpty) return;

    final action = s.undoStack.last;
    final newUndoStack = s.undoStack.sublist(0, s.undoStack.length - 1);

    final newBoard = _applyUndo(s.board, action);

    state = s.copyWith(
      board: newBoard,
      undoStack: newUndoStack,
      redoStack: [...s.redoStack, action],
      isCompleted: false,
    );
  }

  void redo() {
    final s = state;
    if (s == null || s.redoStack.isEmpty) return;

    final action = s.redoStack.last;
    final newRedoStack = s.redoStack.sublist(0, s.redoStack.length - 1);

    final newBoard = _applyRedo(s.board, action);

    state = s.copyWith(
      board: newBoard,
      undoStack: [...s.undoStack, action],
      redoStack: newRedoStack,
      isCompleted: _checkCompleted(newBoard),
    );
  }

  void useHint() {
    final s = state;
    if (s == null || s.isCompleted) return;

    // 空セルをランダムに1つ埋める
    final emptyCells = <(int, int)>[];
    for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 9; c++) {
        final cell = s.board.getCell(r, c);
        if (cell.value == 0 || cell.isError) {
          emptyCells.add((r, c));
        }
      }
    }
    if (emptyCells.isEmpty) return;

    // 選択中のセルがあればそこを優先、なければランダム
    int row, col;
    if (s.selectedCell != null) {
      final sc = s.board.getCell(s.selectedCell!.row, s.selectedCell!.col);
      if (sc.value == 0 || sc.isError) {
        row = s.selectedCell!.row;
        col = s.selectedCell!.col;
      } else {
        final idx = DateTime.now().millisecondsSinceEpoch % emptyCells.length;
        (row, col) = emptyCells[idx];
      }
    } else {
      final idx = DateTime.now().millisecondsSinceEpoch % emptyCells.length;
      (row, col) = emptyCells[idx];
    }

    final correctValue = s.board.solution[row][col];
    final cell = s.board.getCell(row, col);
    final action = GameAction.setValue(
      row: row,
      col: col,
      previousValue: cell.value,
      newValue: correctValue,
    );

    final newCell = cell.copyWith(
      value: correctValue,
      memos: {},
      isError: false,
    );
    final newBoard = s.board.updateCell(row, col, newCell);

    state = s.copyWith(
      board: newBoard,
      undoStack: [...s.undoStack, action],
      redoStack: [],
      hintsUsed: s.hintsUsed + 1,
      selectedCell: CellPosition(row: row, col: col),
      isCompleted: _checkCompleted(newBoard),
    );
  }

  void updateElapsed(Duration elapsed) {
    if (state == null || state!.isCompleted || state!.isPaused) return;
    state = state!.copyWith(elapsed: elapsed);
  }

  void pause() {
    if (state == null) return;
    state = state!.copyWith(isPaused: true);
  }

  void resume() {
    if (state == null) return;
    state = state!.copyWith(isPaused: false);
  }

  Future<void> saveGame() async {
    if (state == null) return;
    await _repo.saveGame(state!);
  }

  Future<bool> loadGame() async {
    final saved = _repo.loadGame();
    if (saved != null) {
      state = saved;
      return true;
    }
    return false;
  }

  Future<void> deleteGame() async {
    await _repo.deleteGame();
    state = null;
  }

  bool get hasSavedGame => _repo.hasSavedGame;

  Board _applyUndo(Board board, GameAction action) {
    return switch (action) {
      SetValueAction(:final row, :final col, :final previousValue) => () {
          final cell = board.getCell(row, col);
          final isError = previousValue != 0 &&
              board.solution[row][col] != previousValue;
          return board.updateCell(
            row,
            col,
            cell.copyWith(value: previousValue, isError: isError),
          );
        }(),
      ToggleMemoAction(:final row, :final col, :final number) => () {
          final cell = board.getCell(row, col);
          final newMemos = Set<int>.from(cell.memos);
          if (newMemos.contains(number)) {
            newMemos.remove(number);
          } else {
            newMemos.add(number);
          }
          return board.updateCell(row, col, cell.copyWith(memos: newMemos));
        }(),
      ClearCellAction(
        :final row,
        :final col,
        :final previousValue,
        :final previousMemos,
      ) =>
        () {
          final cell = board.getCell(row, col);
          final isError = previousValue != 0 &&
              board.solution[row][col] != previousValue;
          return board.updateCell(
            row,
            col,
            cell.copyWith(
              value: previousValue,
              memos: previousMemos,
              isError: isError,
            ),
          );
        }(),
      _ => throw StateError('Unknown action type: $action'),
    };
  }

  Board _applyRedo(Board board, GameAction action) {
    return switch (action) {
      SetValueAction(:final row, :final col, :final newValue) => () {
          final cell = board.getCell(row, col);
          final isError = board.solution[row][col] != newValue;
          return board.updateCell(
            row,
            col,
            cell.copyWith(value: newValue, memos: {}, isError: isError),
          );
        }(),
      ToggleMemoAction(:final row, :final col, :final number) => () {
          final cell = board.getCell(row, col);
          final newMemos = Set<int>.from(cell.memos);
          if (newMemos.contains(number)) {
            newMemos.remove(number);
          } else {
            newMemos.add(number);
          }
          return board.updateCell(row, col, cell.copyWith(memos: newMemos));
        }(),
      ClearCellAction(:final row, :final col) => () {
          final cell = board.getCell(row, col);
          return board.updateCell(
            row,
            col,
            cell.copyWith(value: 0, memos: {}, isError: false),
          );
        }(),
      _ => throw StateError('Unknown action type: $action'),
    };
  }

  bool _checkCompleted(Board board) {
    for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 9; c++) {
        final cell = board.getCell(r, c);
        if (cell.value != board.solution[r][c]) return false;
      }
    }
    return true;
  }
}
