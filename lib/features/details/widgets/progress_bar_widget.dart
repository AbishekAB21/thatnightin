import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';

class ProgressBarWidget extends ConsumerWidget {
  final String statTitle;
  final String leftProgress;
  final String rightProgress;
  final double homeTeamStat;
  final bool ispercent;
  const ProgressBarWidget({
    super.key,
    required this.homeTeamStat,
    required this.leftProgress,
    required this.rightProgress,
    required this.statTitle,
    required this.ispercent,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
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
              ispercent
                  ? Text(
                    "$leftProgress% - $rightProgress%",
                    style: Fontstyles.roboto18px(context, ref),
                  )
                  : Text(
                    "$leftProgress - $rightProgress",
                    style: Fontstyles.roboto18px(context, ref),
                  ),
            ],
          ),
        ),
        SizedBox(height: 10.0),
        LinearPercentIndicator(
          animation: true,
          animateToInitialPercent: true,
          animationDuration: 1000,
          lineHeight: 15,
          percent: homeTeamStat,
          progressColor: color.secondaryGradient2,
          backgroundColor:
              leftProgress == '0' && rightProgress == '0'
                  ? color.textfieldBackground
                  : color.iconColor,
          barRadius: Radius.circular(10),
          padding: EdgeInsets.all(0),
        ),
      ],
    );
  }
}
