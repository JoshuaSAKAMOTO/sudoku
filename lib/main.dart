import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sudoku/repositories/game_repository.dart';
import 'package:sudoku/repositories/statistics_repository.dart';
import 'package:sudoku/providers/game_notifier.dart';
import 'package:sudoku/providers/statistics_notifier.dart';
import 'package:sudoku/screens/home_screen.dart';
import 'package:sudoku/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  final gameRepo = GameRepository();
  await gameRepo.init();

  final statsRepo = StatisticsRepository();
  await statsRepo.init();

  runApp(
    ProviderScope(
      overrides: [
        gameRepositoryProvider.overrideWithValue(gameRepo),
        statisticsRepositoryProvider.overrideWithValue(statsRepo),
      ],
      child: const SudokuApp(),
    ),
  );
}

class SudokuApp extends ConsumerStatefulWidget {
  const SudokuApp({super.key});

  @override
  ConsumerState<SudokuApp> createState() => _SudokuAppState();
}

class _SudokuAppState extends ConsumerState<SudokuApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(statisticsNotifierProvider.notifier).load();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '数独',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
