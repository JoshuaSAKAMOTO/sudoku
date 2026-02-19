import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sudoku/models/difficulty.dart';
import 'package:sudoku/providers/game_notifier.dart';
import 'package:sudoku/providers/timer_notifier.dart';
import 'package:sudoku/screens/game_screen.dart';
import 'package:sudoku/screens/statistics_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasSavedGame = ref.watch(hasSavedGameProvider);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '数独',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                const SizedBox(height: 64),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () => _showDifficultyDialog(context, ref),
                    icon: const Icon(Icons.add),
                    label: const Text('新しいゲーム'),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: hasSavedGame
                        ? () => _continueGame(context, ref)
                        : null,
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('続きから'),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const StatisticsScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.bar_chart),
                    label: const Text('統計'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDifficultyDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('難易度を選択'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: Difficulty.values.map((difficulty) {
            return ListTile(
              title: Text(difficulty.displayName),
              subtitle: Text('空きマス: ${difficulty.removedCells}'),
              onTap: () {
                Navigator.pop(context);
                _startNewGame(context, ref, difficulty);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _startNewGame(BuildContext context, WidgetRef ref, Difficulty difficulty) {
    // ローディング表示
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const PopScope(
        canPop: false,
        child: Center(child: CircularProgressIndicator()),
      ),
    );

    // パズル生成は同期だが、UIをブロックしないようにpostFrameCallbackで実行
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(gameNotifierProvider.notifier).newGame(difficulty);
      ref.read(timerProvider.notifier).start(Duration.zero);
      Navigator.pop(context); // ローディング閉じる
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const GameScreen()),
      );
    });
  }

  Future<void> _continueGame(BuildContext context, WidgetRef ref) async {
    final nav = Navigator.of(context);
    final success = await ref.read(gameNotifierProvider.notifier).loadGame();
    if (success) {
      final game = ref.read(gameNotifierProvider);
      if (game != null) {
        ref.read(timerProvider.notifier).start(game.elapsed);
        ref.read(gameNotifierProvider.notifier).resume();
        nav.push(
          MaterialPageRoute(builder: (_) => const GameScreen()),
        );
      }
    }
  }
}
