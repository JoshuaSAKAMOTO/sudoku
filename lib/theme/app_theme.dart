import 'package:flutter/material.dart';

class AppTheme {
  static const _seedColor = Color(0xFF1565C0);

  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.light,
    );
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
    );
  }

  static ThemeData dark() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
    );
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
    );
  }
}

class SudokuColors {
  // セル背景色
  static Color givenCellBg(BuildContext context) =>
      Theme.of(context).colorScheme.surfaceContainerHighest;
  static Color selectedCellBg(BuildContext context) =>
      Theme.of(context).colorScheme.primaryContainer;
  static Color highlightedCellBg(BuildContext context) =>
      Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3);
  static Color errorCellBg(BuildContext context) =>
      Theme.of(context).colorScheme.errorContainer;
  static Color normalCellBg(BuildContext context) =>
      Theme.of(context).colorScheme.surface;

  // テキスト色
  static Color givenText(BuildContext context) =>
      Theme.of(context).colorScheme.onSurface;
  static Color userText(BuildContext context) =>
      Theme.of(context).colorScheme.primary;
  static Color errorText(BuildContext context) =>
      Theme.of(context).colorScheme.error;
  static Color memoText(BuildContext context) =>
      Theme.of(context).colorScheme.onSurfaceVariant;

  // グリッド線
  static Color thinLine(BuildContext context) =>
      Theme.of(context).colorScheme.outlineVariant;
  static Color thickLine(BuildContext context) =>
      Theme.of(context).colorScheme.onSurface;
}
