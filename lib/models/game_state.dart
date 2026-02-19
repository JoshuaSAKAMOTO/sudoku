import 'package:freezed_annotation/freezed_annotation.dart';
import 'board.dart';
import 'cell.dart';
import 'difficulty.dart';
import 'game_action.dart';
import 'statistics.dart';

part 'game_state.freezed.dart';
part 'game_state.g.dart';

@freezed
abstract class GameState with _$GameState {
  const factory GameState({
    required String id,
    required Board board,
    required Difficulty difficulty,
    @DurationConverter() @Default(Duration.zero) Duration elapsed,
    @Default([]) List<GameAction> undoStack,
    @Default([]) List<GameAction> redoStack,
    @Default(0) int hintsUsed,
    @Default(false) bool isCompleted,
    @Default(false) bool isPaused,
    CellPosition? selectedCell,
  }) = _GameState;

  factory GameState.fromJson(Map<String, dynamic> json) =>
      _$GameStateFromJson(json);
}

extension GameStateX on GameState {
  int get remainingCells {
    int count = 0;
    for (final row in board.cells) {
      for (final cell in row) {
        if (cell.value == 0) count++;
      }
    }
    return count;
  }

  bool get canUndo => undoStack.isNotEmpty;
  bool get canRedo => redoStack.isNotEmpty;
}
