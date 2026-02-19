enum Difficulty {
  easy(removedCells: 35),
  medium(removedCells: 45),
  hard(removedCells: 55);

  final int removedCells;
  const Difficulty({required this.removedCells});

  String get displayName {
    switch (this) {
      case Difficulty.easy:
        return 'かんたん';
      case Difficulty.medium:
        return 'ふつう';
      case Difficulty.hard:
        return 'むずかしい';
    }
  }
}
