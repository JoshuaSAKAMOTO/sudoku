import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sudoku/models/models.dart';
import 'package:sudoku/providers/statistics_notifier.dart';

class StatisticsScreen extends ConsumerWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(statisticsNotifierProvider);

    return DefaultTabController(
      length: Difficulty.values.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('統計'),
          bottom: TabBar(
            tabs: Difficulty.values
                .map((d) => Tab(text: d.displayName))
                .toList(),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _confirmReset(context, ref),
            ),
          ],
        ),
        body: TabBarView(
          children: Difficulty.values.map((difficulty) {
            final ds =
                stats.byDifficulty[difficulty] ?? const DifficultyStats();
            return _buildStatsTab(context, ds);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildStatsTab(BuildContext context, DifficultyStats stats) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          _StatCard(
            icon: Icons.games,
            label: 'プレイ数',
            value: '${stats.gamesPlayed}',
          ),
          const SizedBox(height: 12),
          _StatCard(
            icon: Icons.emoji_events,
            label: 'クリア数',
            value: '${stats.gamesWon}',
          ),
          const SizedBox(height: 12),
          _StatCard(
            icon: Icons.percent,
            label: 'クリア率',
            value: '${(stats.winRate * 100).toStringAsFixed(1)}%',
          ),
          const SizedBox(height: 12),
          _StatCard(
            icon: Icons.timer,
            label: 'ベストタイム',
            value: stats.bestTime != null
                ? _formatDuration(stats.bestTime!)
                : '--:--',
          ),
          const SizedBox(height: 12),
          _StatCard(
            icon: Icons.av_timer,
            label: '平均タイム',
            value: stats.averageTime != null
                ? _formatDuration(stats.averageTime!)
                : '--:--',
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.toString().padLeft(2, '0');
    final seconds = (d.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void _confirmReset(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('統計をリセット'),
        content: const Text('すべての統計データを削除しますか？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('キャンセル'),
          ),
          FilledButton(
            onPressed: () {
              ref.read(statisticsNotifierProvider.notifier).reset();
              Navigator.pop(context);
            },
            child: const Text('リセット'),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(label),
        trailing: Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
