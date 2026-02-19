import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sudoku/providers/game_notifier.dart';
import 'package:sudoku/providers/memo_mode_provider.dart';

class NumberPad extends ConsumerWidget {
  const NumberPad({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameNotifierProvider);
    final isMemoMode = ref.watch(memoModeProvider);

    // 各数字の残り個数を計算
    final remaining = <int, int>{};
    if (gameState != null) {
      for (int n = 1; n <= 9; n++) {
        int count = 0;
        for (final row in gameState.board.cells) {
          for (final cell in row) {
            if (cell.value == n) count++;
          }
        }
        remaining[n] = 9 - count;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(9, (index) {
          final number = index + 1;
          final count = remaining[number] ?? 9;
          final isDisabled = count <= 0 && !isMemoMode;

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: _NumberButton(
                number: number,
                remaining: count,
                isDisabled: isDisabled,
                isMemoMode: isMemoMode,
                onTap: () {
                  if (isDisabled) return;
                  final notifier =
                      ref.read(gameNotifierProvider.notifier);
                  if (isMemoMode) {
                    notifier.toggleMemo(number);
                  } else {
                    notifier.setValue(number);
                  }
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _NumberButton extends StatelessWidget {
  final int number;
  final int remaining;
  final bool isDisabled;
  final bool isMemoMode;
  final VoidCallback onTap;

  const _NumberButton({
    required this.number,
    required this.remaining,
    required this.isDisabled,
    required this.isMemoMode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isDisabled ? null : onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isDisabled
                  ? colorScheme.outlineVariant.withValues(alpha: 0.3)
                  : colorScheme.outline,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$number',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDisabled
                      ? colorScheme.onSurface.withValues(alpha: 0.3)
                      : colorScheme.onSurface,
                ),
              ),
              Text(
                '$remaining',
                style: TextStyle(
                  fontSize: 10,
                  color: isDisabled
                      ? colorScheme.onSurface.withValues(alpha: 0.2)
                      : colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
