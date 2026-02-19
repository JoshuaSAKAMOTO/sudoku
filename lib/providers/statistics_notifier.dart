import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sudoku/models/models.dart';
import 'package:sudoku/repositories/statistics_repository.dart';

final statisticsRepositoryProvider = Provider<StatisticsRepository>((ref) {
  return StatisticsRepository();
});

final statisticsNotifierProvider =
    NotifierProvider<StatisticsNotifier, Statistics>(StatisticsNotifier.new);

class StatisticsNotifier extends Notifier<Statistics> {
  @override
  Statistics build() => const Statistics();

  StatisticsRepository get _repo => ref.read(statisticsRepositoryProvider);

  void load() {
    state = _repo.loadStats();
  }

  Future<void> recordGame({
    required Difficulty difficulty,
    required bool won,
    required Duration time,
  }) async {
    final current = state.byDifficulty[difficulty] ?? const DifficultyStats();

    final newGamesPlayed = current.gamesPlayed + 1;
    final newGamesWon = current.gamesWon + (won ? 1 : 0);

    Duration? newBestTime = current.bestTime;
    Duration? newAverageTime = current.averageTime;

    if (won) {
      if (newBestTime == null || time < newBestTime) {
        newBestTime = time;
      }
      if (newAverageTime == null) {
        newAverageTime = time;
      } else {
        final totalPrevious =
            newAverageTime.inMilliseconds * (newGamesWon - 1);
        newAverageTime = Duration(
          milliseconds: (totalPrevious + time.inMilliseconds) ~/ newGamesWon,
        );
      }
    }

    final newStats = DifficultyStats(
      gamesPlayed: newGamesPlayed,
      gamesWon: newGamesWon,
      bestTime: newBestTime,
      averageTime: newAverageTime,
    );

    final newByDifficulty = Map<Difficulty, DifficultyStats>.from(
      state.byDifficulty,
    );
    newByDifficulty[difficulty] = newStats;

    state = state.copyWith(byDifficulty: newByDifficulty);
    await _repo.saveStats(state);
  }

  Future<void> reset() async {
    state = const Statistics();
    await _repo.saveStats(state);
  }
}
