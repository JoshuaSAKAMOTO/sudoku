import 'package:freezed_annotation/freezed_annotation.dart';
import 'difficulty.dart';

part 'statistics.freezed.dart';
part 'statistics.g.dart';

@freezed
abstract class Statistics with _$Statistics {
  const factory Statistics({
    @Default({}) Map<Difficulty, DifficultyStats> byDifficulty,
  }) = _Statistics;

  factory Statistics.fromJson(Map<String, dynamic> json) =>
      _$StatisticsFromJson(json);
}

@freezed
abstract class DifficultyStats with _$DifficultyStats {
  const factory DifficultyStats({
    @Default(0) int gamesPlayed,
    @Default(0) int gamesWon,
    @DurationConverter() Duration? bestTime,
    @DurationConverter() Duration? averageTime,
  }) = _DifficultyStats;

  factory DifficultyStats.fromJson(Map<String, dynamic> json) =>
      _$DifficultyStatsFromJson(json);
}

extension DifficultyStatsX on DifficultyStats {
  double get winRate =>
      gamesPlayed > 0 ? gamesWon / gamesPlayed : 0.0;
}

class DurationConverter implements JsonConverter<Duration?, int?> {
  const DurationConverter();

  @override
  Duration? fromJson(int? json) =>
      json != null ? Duration(milliseconds: json) : null;

  @override
  int? toJson(Duration? object) => object?.inMilliseconds;
}
