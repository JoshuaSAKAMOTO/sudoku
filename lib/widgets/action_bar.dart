import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sudoku/models/models.dart';
import 'package:sudoku/providers/game_notifier.dart';
import 'package:sudoku/providers/memo_mode_provider.dart';

class ActionBar extends ConsumerWidget {
  const ActionBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameNotifierProvider);
    final isMemoMode = ref.watch(memoModeProvider);

    final canUndo = gameState?.canUndo ?? false;
    final canRedo = gameState?.canRedo ?? false;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ActionButton(
            icon: Icons.undo,
            label: '戻す',
            enabled: canUndo,
            onTap: () =>
                ref.read(gameNotifierProvider.notifier).undo(),
          ),
          _ActionButton(
            icon: Icons.redo,
            label: '進む',
            enabled: canRedo,
            onTap: () =>
                ref.read(gameNotifierProvider.notifier).redo(),
          ),
          _ActionButton(
            icon: isMemoMode ? Icons.edit : Icons.edit_outlined,
            label: 'メモ',
            isActive: isMemoMode,
            onTap: () => ref.read(memoModeProvider.notifier).toggle(),
          ),
          _ActionButton(
            icon: Icons.lightbulb_outline,
            label: 'ヒント',
            onTap: () =>
                ref.read(gameNotifierProvider.notifier).useHint(),
          ),
          _ActionButton(
            icon: Icons.delete_outline,
            label: '消去',
            onTap: () =>
                ref.read(gameNotifierProvider.notifier).clearCell(),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool enabled;
  final bool isActive;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    this.enabled = true,
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final color = !enabled
        ? colorScheme.onSurface.withValues(alpha: 0.3)
        : isActive
            ? colorScheme.primary
            : colorScheme.onSurface;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(fontSize: 11, color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
