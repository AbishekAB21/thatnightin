import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/features/details/widgets/custom_comparison_bar.dart';
import 'package:thatnightin/features/details/core/provider/comparison_bar_provider.dart';

class ProgressBarWidget extends ConsumerWidget {
  final String id;
  final String statTitle;
  final String leftProgress;
  final String rightProgress;
  final bool ispercent;
  const ProgressBarWidget({
    super.key,
    required this.id,
    required this.leftProgress,
    required this.rightProgress,
    required this.statTitle,
    required this.ispercent,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(comparisonStateProvider(id).notifier)
          .animateTo(
            _calculateRelativePercent(leftProgress, rightProgress, true),
            _calculateRelativePercent(leftProgress, rightProgress, false),
          );
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.0),
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Text(statTitle, style: Fontstyles.roboto20px(context, ref)),
              SizedBox(width: 10.0),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ispercent
                  ? Text(
                    "$leftProgress%",
                    style: Fontstyles.roboto18px(context, ref),
                  )
                  : Text(
                    leftProgress,
                    style: Fontstyles.roboto18px(context, ref),
                  ),
              ispercent
                  ? Text(
                    "$rightProgress%",
                    style: Fontstyles.roboto18px(context, ref),
                  )
                  : Text(
                    rightProgress,
                    style: Fontstyles.roboto18px(context, ref),
                  ),
            ],
          ),
        ),
        SizedBox(height: 10.0),

        Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(comparisonStateProvider(id));
            return CustomComparisonBar(
              leftPercent: state.leftPercent,
              rightPercent: state.rightPercent,
              leftColor: color.secondaryGradient2,
              rightColor: color.iconColor,
            );
          },
        ),
      ],
    );
  }

  double _getPercentFromString(String value) {
    final percent = double.tryParse(value) ?? 0.0;
    return percent;
  }

  double _calculateRelativePercent(String left, String right, bool isLeft) {
    final leftValue = double.tryParse(left) ?? 0.0;
    final rightValue = double.tryParse(right) ?? 0.0;
    final total = leftValue + rightValue;
    if (total == 0) return 0.0;
    return isLeft ? (leftValue / total) : (rightValue / total);
  }
}
