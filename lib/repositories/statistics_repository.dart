import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:sudoku/models/statistics.dart';

class StatisticsRepository {
  static const _boxName = 'statistics';
  static const _key = 'stats';

  late Box<String> _box;

  Future<void> init() async {
    _box = await Hive.openBox<String>(_boxName);
  }

  Future<void> saveStats(Statistics stats) async {
    final json = jsonEncode(stats.toJson());
    await _box.put(_key, json);
  }

  Statistics loadStats() {
    final json = _box.get(_key);
    if (json == null) return const Statistics();
    return Statistics.fromJson(jsonDecode(json) as Map<String, dynamic>);
  }
}
