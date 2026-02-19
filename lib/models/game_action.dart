import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_action.freezed.dart';
part 'game_action.g.dart';

@freezed
abstract class GameAction with _$GameAction {
  const factory GameAction.setValue({
    required int row,
    required int col,
    required int previousValue,
    required int newValue,
  }) = SetValueAction;

  const factory GameAction.toggleMemo({
    required int row,
    required int col,
    required int number,
  }) = ToggleMemoAction;

  const factory GameAction.clearCell({
    required int row,
    required int col,
    required int previousValue,
    required Set<int> previousMemos,
  }) = ClearCellAction;

  factory GameAction.fromJson(Map<String, dynamic> json) =>
      _$GameActionFromJson(json);
}
