import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sudoku/models/models.dart';
import 'package:sudoku/providers/game_notifier.dart';
import 'package:sudoku/theme/app_theme.dart';
import 'package:sudoku/widgets/sudoku_cell.dart';

class SudokuBoard extends ConsumerWidget {
  const SudokuBoard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameState = ref.watch(gameNotifierProvider);
    if (gameState == null) return const SizedBox.shrink();

    final board = gameState.board;
    final selected = gameState.selectedCell;

    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: SudokuColors.thickLine(context),
            width: 2,
          ),
        ),
        child: Column(
          children: List.generate(9, (row) {
            return Expanded(
              child: Row(
                children: List.generate(9, (col) {
                  final cell = board.getCell(row, col);
                  final isSelected = selected != null &&
                      selected.row == row &&
                      selected.col == col;
                  final isHighlighted = _isHighlighted(selected, row, col);
                  final isSameNumber = _isSameNumber(board, selected, row, col);

                  return Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: (col + 1) % 3 == 0 && col < 8
                                ? SudokuColors.thickLine(context)
                                : SudokuColors.thinLine(context),
                            width: (col + 1) % 3 == 0 && col < 8 ? 2 : 0.5,
                          ),
                          bottom: BorderSide(
                            color: (row + 1) % 3 == 0 && row < 8
                                ? SudokuColors.thickLine(context)
                                : SudokuColors.thinLine(context),
                            width: (row + 1) % 3 == 0 && row < 8 ? 2 : 0.5,
                          ),
                        ),
                      ),
                      child: SudokuCellWidget(
                        cell: cell,
                        isSelected: isSelected,
                        isHighlighted: isHighlighted,
                        isSameNumber: isSameNumber,
                        onTap: () {
                          ref
                              .read(gameNotifierProvider.notifier)
                              .selectCell(row, col);
                        },
                      ),
                    ),
                  );
                }),
              ),
            );
          }),
        ),
      ),
    );
  }

  bool _isHighlighted(CellPosition? selected, int row, int col) {
    if (selected == null) return false;
    return selected.row == row ||
        selected.col == col ||
        (_boxIndex(selected.row, selected.col) == _boxIndex(row, col));
  }

  bool _isSameNumber(
      Board board, CellPosition? selected, int row, int col) {
    if (selected == null) return false;
    final selectedCell = board.getCell(selected.row, selected.col);
    if (selectedCell.value == 0) return false;
    final currentCell = board.getCell(row, col);
    return currentCell.value == selectedCell.value &&
        !(row == selected.row && col == selected.col);
  }

  int _boxIndex(int row, int col) => (row ~/ 3) * 3 + col ~/ 3;
}
