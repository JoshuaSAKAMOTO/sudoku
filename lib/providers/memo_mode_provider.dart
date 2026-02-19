import 'package:flutter_riverpod/flutter_riverpod.dart';

final memoModeProvider =
    NotifierProvider<MemoModeNotifier, bool>(MemoModeNotifier.new);

class MemoModeNotifier extends Notifier<bool> {
  @override
  bool build() => false;

  void toggle() => state = !state;
}
