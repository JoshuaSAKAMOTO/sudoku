/// バックトラッキング + 制約伝播による数独ソルバー
class SudokuSolver {
  /// 盤面を解く。解が見つかれば true を返し、grid を変更する。
  static bool solve(List<List<int>> grid) {
    final empty = _findEmpty(grid);
    if (empty == null) return true;
    final (row, col) = empty;

    final candidates = _getCandidates(grid, row, col);
    for (final num in candidates) {
      grid[row][col] = num;
      if (solve(grid)) return true;
      grid[row][col] = 0;
    }
    return false;
  }

  /// 解の個数をカウントする（maxCount に達したら打ち切り）
  static int countSolutions(List<List<int>> grid, {int maxCount = 2}) {
    return _countSolutionsHelper(grid, maxCount);
  }

  static int _countSolutionsHelper(List<List<int>> grid, int maxCount) {
    final empty = _findEmpty(grid);
    if (empty == null) return 1;
    final (row, col) = empty;

    int count = 0;
    final candidates = _getCandidates(grid, row, col);
    for (final num in candidates) {
      grid[row][col] = num;
      count += _countSolutionsHelper(grid, maxCount - count);
      grid[row][col] = 0;
      if (count >= maxCount) break;
    }
    return count;
  }

  /// 指定セルに入りうる候補数字を返す
  static Set<int> _getCandidates(List<List<int>> grid, int row, int col) {
    final used = <int>{};

    // 行
    for (int c = 0; c < 9; c++) {
      if (grid[row][c] != 0) used.add(grid[row][c]);
    }

    // 列
    for (int r = 0; r < 9; r++) {
      if (grid[r][col] != 0) used.add(grid[r][col]);
    }

    // 3x3 ボックス
    final boxRow = (row ~/ 3) * 3;
    final boxCol = (col ~/ 3) * 3;
    for (int r = boxRow; r < boxRow + 3; r++) {
      for (int c = boxCol; c < boxCol + 3; c++) {
        if (grid[r][c] != 0) used.add(grid[r][c]);
      }
    }

    return {for (int i = 1; i <= 9; i++) if (!used.contains(i)) i};
  }

  /// 最初の空セルを見つける（制約が最も厳しいセルを優先: MRV）
  static (int, int)? _findEmpty(List<List<int>> grid) {
    int minCandidates = 10;
    (int, int)? bestCell;

    for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 9; c++) {
        if (grid[r][c] == 0) {
          final count = _getCandidates(grid, r, c).length;
          if (count < minCandidates) {
            minCandidates = count;
            bestCell = (r, c);
            if (count == 1) return bestCell;
          }
        }
      }
    }
    return bestCell;
  }

  /// 外部から使えるように公開（メモ自動入力等で利用）
  static Set<int> getCandidates(List<List<int>> grid, int row, int col) {
    return _getCandidates(grid, row, col);
  }

  /// 盤面が有効かどうか検証（重複がないか）
  static bool isValid(List<List<int>> grid) {
    // 行チェック
    for (int r = 0; r < 9; r++) {
      final seen = <int>{};
      for (int c = 0; c < 9; c++) {
        final v = grid[r][c];
        if (v != 0 && !seen.add(v)) return false;
      }
    }

    // 列チェック
    for (int c = 0; c < 9; c++) {
      final seen = <int>{};
      for (int r = 0; r < 9; r++) {
        final v = grid[r][c];
        if (v != 0 && !seen.add(v)) return false;
      }
    }

    // ボックスチェック
    for (int br = 0; br < 3; br++) {
      for (int bc = 0; bc < 3; bc++) {
        final seen = <int>{};
        for (int r = br * 3; r < br * 3 + 3; r++) {
          for (int c = bc * 3; c < bc * 3 + 3; c++) {
            final v = grid[r][c];
            if (v != 0 && !seen.add(v)) return false;
          }
        }
      }
    }
    return true;
  }
}
