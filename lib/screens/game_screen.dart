import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sudoku/models/models.dart';
import 'package:sudoku/providers/game_notifier.dart';
import 'package:sudoku/providers/statistics_notifier.dart';
import 'package:sudoku/providers/timer_notifier.dart';
import 'package:sudoku/widgets/action_bar.dart';
import 'package:sudoku/widgets/number_pad.dart';
import 'package:sudoku/widgets/sudoku_board.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final game = ref.read(gameNotifierProvider);
      if (game != null) {
        ref.read(timerProvider.notifier).start(game.elapsed);
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      ref.read(gameNotifierProvider.notifier).pause();
      ref.read(gameNotifierProvider.notifier).saveGame();
    } else if (state == AppLifecycleState.resumed) {
      ref.read(gameNotifierProvider.notifier).resume();
    }
  }

  @override
  Widget build(BuildContext context) {
    final gameState = ref.watch(gameNotifierProvider);
    if (gameState == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final elapsed = ref.watch(timerProvider);

    ref.listen(gameNotifierProvider, (prev, next) {
      if (next != null && next.isCompleted && (prev == null || !prev.isCompleted)) {
        _onGameCompleted(next);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              gameState.difficulty.displayName,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 16),
            Text(
              _formatDuration(elapsed),
              style: const TextStyle(
                fontSize: 16,
                fontFeatures: [FontFeature.tabularFigures()],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              gameState.isPaused ? Icons.play_arrow : Icons.pause,
            ),
            onPressed: () {
              if (gameState.isPaused) {
                ref.read(gameNotifierProvider.notifier).resume();
              } else {
                ref.read(gameNotifierProvider.notifier).pause();
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: gameState.isPaused
            ? _buildPausedOverlay(context)
            : _buildGameContent(),
      ),
    );
  }

  Widget _buildPausedOverlay(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.pause_circle_outline,
            size: 64,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 16),
          const Text(
            '一時停止中',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () {
              ref.read(gameNotifierProvider.notifier).resume();
            },
            icon: const Icon(Icons.play_arrow),
            label: const Text('再開'),
          ),
        ],
      ),
    );
  }

  Widget _buildGameContent() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // アクションバー + ナンバーパッド + マージンの高さを確保してボードサイズを計算
        final controlsHeight = 140.0;
        final availableHeight = constraints.maxHeight - controlsHeight;
        final availableWidth = constraints.maxWidth - 16;
        final boardSize = availableHeight < availableWidth
            ? availableHeight
            : availableWidth;

        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: boardSize,
              height: boardSize,
              child: const SudokuBoard(),
            ),
            const ActionBar(),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: boardSize),
              child: const NumberPad(),
            ),
          ],
        );
      },
    );
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.toString().padLeft(2, '0');
    final seconds = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void _onGameCompleted(GameState game) {
    ref.read(timerProvider.notifier).stop();
    ref.read(gameNotifierProvider.notifier).saveGame().then((_) {
      ref.read(gameNotifierProvider.notifier).deleteGame();
    });
    ref.read(statisticsNotifierProvider.notifier).recordGame(
          difficulty: game.difficulty,
          won: true,
          time: game.elapsed,
        );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('クリア！'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.emoji_events, size: 64, color: Colors.amber),
            const SizedBox(height: 16),
            Text('タイム: ${_formatDuration(game.elapsed)}'),
            Text('ヒント使用回数: ${game.hintsUsed}'),
          ],
        ),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('ホームに戻る'),
          ),
        ],
      ),
    );
  }
}
