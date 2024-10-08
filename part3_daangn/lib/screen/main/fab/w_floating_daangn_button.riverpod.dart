import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'w_floating_daangn_button.state.dart';

final floatingButtonStateProvider =
    StateNotifierProvider<FloatingButtonStateNotifier, FloatingButtonState>(
  (ref) => FloatingButtonStateNotifier(
    const FloatingButtonState(false, false, false),
  ),
);

class FloatingButtonStateNotifier extends StateNotifier<FloatingButtonState> {
  FloatingButtonStateNotifier(super.state);

  bool needButtonBigger = false;

  void toggleMenu() {
    final isExpanded = state.isExpanded;
    final isSmall = state.isSmall;

    state = state.copyWith(isExpanded: !state.isExpanded, isSmall: needButtonBigger ? false : true);

    if (needButtonBigger) {
      needButtonBigger = false;
    }

    if (!isSmall && !isExpanded) {
      needButtonBigger = true;
    }
  }

  void changeButtonSize(bool isSmall) {
    if (state.isExpanded) {
      return;
    }

    state = state.copyWith(isSmall: isSmall);
  }

  void hideButton() {
    state = state.copyWith(isHided: true);
  }

  void showButton() {
    state = state.copyWith(isHided: false);
  }
}
