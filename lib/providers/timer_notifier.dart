import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sudoku/providers/game_notifier.dart';

final timerProvider = NotifierProvider<TimerNotifier, Duration>(TimerNotifier.new);

class TimerNotifier extends Notifier<Duration> {
  Timer? _timer;

  @override
  Duration build() {
    ref.onDispose(() => _timer?.cancel());
    return Duration.zero;
  }

  void start(Duration initial) {
    _timer?.cancel();
    state = initial;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final game = ref.read(gameNotifierProvider);
      if (game != null && !game.isPaused && !game.isCompleted) {
        state = state + const Duration(seconds: 1);
        ref.read(gameNotifierProvider.notifier).updateElapsed(state);
      }
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  void reset() {
    _timer?.cancel();
    _timer = null;
    state = Duration.zero;
  }
}
