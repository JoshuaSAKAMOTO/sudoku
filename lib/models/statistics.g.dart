// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Statistics _$StatisticsFromJson(Map<String, dynamic> json) => _Statistics(
  byDifficulty:
      (json['byDifficulty'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
          $enumDecode(_$DifficultyEnumMap, k),
          DifficultyStats.fromJson(e as Map<String, dynamic>),
        ),
      ) ??
      const {},
);

Map<String, dynamic> _$StatisticsToJson(_Statistics instance) =>
    <String, dynamic>{
      'byDifficulty': instance.byDifficulty.map(
        (k, e) => MapEntry(_$DifficultyEnumMap[k]!, e),
      ),
    };

const _$DifficultyEnumMap = {
  Difficulty.easy: 'easy',
  Difficulty.medium: 'medium',
  Difficulty.hard: 'hard',
};

_DifficultyStats _$DifficultyStatsFromJson(Map<String, dynamic> json) =>
    _DifficultyStats(
      gamesPlayed: (json['gamesPlayed'] as num?)?.toInt() ?? 0,
      gamesWon: (json['gamesWon'] as num?)?.toInt() ?? 0,
      bestTime: const DurationConverter().fromJson(
        (json['bestTime'] as num?)?.toInt(),
      ),
      averageTime: const DurationConverter().fromJson(
        (json['averageTime'] as num?)?.toInt(),
      ),
    );

Map<String, dynamic> _$DifficultyStatsToJson(_DifficultyStats instance) =>
    <String, dynamic>{
      'gamesPlayed': instance.gamesPlayed,
      'gamesWon': instance.gamesWon,
      'bestTime': const DurationConverter().toJson(instance.bestTime),
      'averageTime': const DurationConverter().toJson(instance.averageTime),
    };
