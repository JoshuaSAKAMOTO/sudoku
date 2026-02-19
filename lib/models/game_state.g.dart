// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameState _$GameStateFromJson(Map<String, dynamic> json) => _GameState(
  id: json['id'] as String,
  board: Board.fromJson(json['board'] as Map<String, dynamic>),
  difficulty: $enumDecode(_$DifficultyEnumMap, json['difficulty']),
  elapsed: json['elapsed'] == null
      ? Duration.zero
      : Duration(microseconds: (json['elapsed'] as num).toInt()),
  undoStack:
      (json['undoStack'] as List<dynamic>?)
          ?.map((e) => GameAction.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  redoStack:
      (json['redoStack'] as List<dynamic>?)
          ?.map((e) => GameAction.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  hintsUsed: (json['hintsUsed'] as num?)?.toInt() ?? 0,
  isCompleted: json['isCompleted'] as bool? ?? false,
  isPaused: json['isPaused'] as bool? ?? false,
  selectedCell: json['selectedCell'] == null
      ? null
      : CellPosition.fromJson(json['selectedCell'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GameStateToJson(_GameState instance) =>
    <String, dynamic>{
      'id': instance.id,
      'board': instance.board,
      'difficulty': _$DifficultyEnumMap[instance.difficulty]!,
      'elapsed': instance.elapsed.inMicroseconds,
      'undoStack': instance.undoStack,
      'redoStack': instance.redoStack,
      'hintsUsed': instance.hintsUsed,
      'isCompleted': instance.isCompleted,
      'isPaused': instance.isPaused,
      'selectedCell': instance.selectedCell,
    };

const _$DifficultyEnumMap = {
  Difficulty.easy: 'easy',
  Difficulty.medium: 'medium',
  Difficulty.hard: 'hard',
};
