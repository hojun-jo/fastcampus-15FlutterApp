import 'package:flutter_riverpod/flutter_riverpod.dart';

class FloatingButtonState {
  bool isExpanded;
  bool isSmall;

  FloatingButtonState()
      : isExpanded = false,
        isSmall = false;
}

final floatingButtonStateProvider =
    StateNotifierProvider<FloatingButtonStateNotifier, FloatingButtonState>(
  (ref) => FloatingButtonStateNotifier(
    FloatingButtonState(),
  ),
);

class FloatingButtonStateNotifier extends StateNotifier<FloatingButtonState> {
  FloatingButtonStateNotifier(super.state);

  void onTapButton() {
    state = state
        ..isExpanded = !state.isExpanded
        ..isSmall = true;
  }

  void changeButtonSize(bool isSmall) {
    state = state
      ..isSmall = isSmall;
  }
}
