import 'package:flutter/material.dart';
import 'package:sudoku/models/cell.dart';
import 'package:sudoku/theme/app_theme.dart';

class SudokuCellWidget extends StatelessWidget {
  final Cell cell;
  final bool isSelected;
  final bool isHighlighted;
  final bool isSameNumber;
  final VoidCallback onTap;

  const SudokuCellWidget({
    super.key,
    required this.cell,
    required this.isSelected,
    required this.isHighlighted,
    required this.isSameNumber,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: _backgroundColor(context),
        ),
        child: Center(
          child: cell.value != 0
              ? _buildValueText(context)
              : cell.memos.isNotEmpty
                  ? _buildMemos(context)
                  : null,
        ),
      ),
    );
  }

  Color _backgroundColor(BuildContext context) {
    if (isSelected) return SudokuColors.selectedCellBg(context);
    if (cell.isError) return SudokuColors.errorCellBg(context);
    if (isSameNumber) {
      return SudokuColors.selectedCellBg(context).withValues(alpha: 0.5);
    }
    if (isHighlighted) return SudokuColors.highlightedCellBg(context);
    if (cell.isGiven) return SudokuColors.givenCellBg(context);
    return SudokuColors.normalCellBg(context);
  }

  Widget _buildValueText(BuildContext context) {
    Color textColor;
    if (cell.isError) {
      textColor = SudokuColors.errorText(context);
    } else if (cell.isGiven) {
      textColor = SudokuColors.givenText(context);
    } else {
      textColor = SudokuColors.userText(context);
    }

    return Text(
      '${cell.value}',
      style: TextStyle(
        fontSize: 22,
        fontWeight: cell.isGiven ? FontWeight.bold : FontWeight.w500,
        color: textColor,
      ),
    );
  }

  Widget _buildMemos(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.maxWidth / 3;
        return Wrap(
          children: List.generate(9, (index) {
            final number = index + 1;
            final hasMemo = cell.memos.contains(number);
            return SizedBox(
              width: size,
              height: size,
              child: Center(
                child: Text(
                  hasMemo ? '$number' : '',
                  style: TextStyle(
                    fontSize: size * 0.6,
                    color: SudokuColors.memoText(context),
                    height: 1,
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
