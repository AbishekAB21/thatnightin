import 'package:flutter_riverpod/flutter_riverpod.dart';

class ComparisonState {
  final double leftPercent;
  final double rightPercent;
  final bool hasAnimated;

  ComparisonState({
    required this.leftPercent,
    required this.rightPercent,
    this.hasAnimated = false,
  });

  ComparisonState copyWith({
    double? leftPercent,
    double? rightPercent,
    bool? hasAnimated,
  }) {
    return ComparisonState(
      leftPercent: leftPercent ?? this.leftPercent,
      rightPercent: rightPercent ?? this.rightPercent,
      hasAnimated: hasAnimated ?? this.hasAnimated,
    );
  }
}

class ComparisonBarNotifier extends StateNotifier<ComparisonState> {
  ComparisonBarNotifier()
    : super(
        ComparisonState(leftPercent: 0, rightPercent: 0, hasAnimated: false),
      );

  // Call this once data is loaded
  void animateTo(double left, double right) {
    if (!state.hasAnimated) {
      state = state.copyWith(
        leftPercent: left,
        rightPercent: right,
        hasAnimated: true,
      );
    }
  }
}

// Provider
final comparisonStateProvider = StateNotifierProvider.family<
  ComparisonBarNotifier,
  ComparisonState,
  String
>((ref, id) => ComparisonBarNotifier());
