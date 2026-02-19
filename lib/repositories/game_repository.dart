import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:sudoku/models/game_state.dart';

class GameRepository {
  static const _boxName = 'game';
  static const _key = 'current_game';

  late Box<String> _box;

  Future<void> init() async {
    _box = await Hive.openBox<String>(_boxName);
  }

  Future<void> saveGame(GameState state) async {
    final json = jsonEncode(state.toJson());
    await _box.put(_key, json);
  }

  GameState? loadGame() {
    final json = _box.get(_key);
    if (json == null) return null;
    return GameState.fromJson(jsonDecode(json) as Map<String, dynamic>);
  }

  Future<void> deleteGame() async {
    await _box.delete(_key);
  }

  bool get hasSavedGame => _box.containsKey(_key);
}
