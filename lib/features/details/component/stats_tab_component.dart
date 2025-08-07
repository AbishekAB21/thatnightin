import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/features/details/widgets/comparison_bar_widget.dart';

class StatsTabComponent extends ConsumerWidget {
  const StatsTabComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          right: 10.0,
          left: 10.0,
          bottom: 14.5,
        ),
        child: Column(
          children: [
            // Possession
            ComparisonBarWidget(
              id: 'Possession',

              leftProgress: "75",
              rightProgress: "25",
              statTitle: "Possession",
              ispercent: true,
            ),

            SizedBox(height: 10.0),

            // Shots
            ComparisonBarWidget(
              id: 'Shots',

              leftProgress: "25",
              rightProgress: "15",
              statTitle: "Shots",
              ispercent: false,
            ),

            SizedBox(height: 10.0),

            // Shots on target
            ComparisonBarWidget(
              id: 'Shots on target',

              leftProgress: "8",
              rightProgress: "2",
              statTitle: "Shots on target",
              ispercent: false,
            ),

            SizedBox(height: 10.0),

            // Passes Accuracy
            ComparisonBarWidget(
              id: 'Pass Accuracy',

              leftProgress: "40",
              rightProgress: "60",
              statTitle: "Pass Accuracy",
              ispercent: true,
            ),

            SizedBox(height: 10.0),

            // Offsides
            ComparisonBarWidget(
              id: 'Offsides',

              leftProgress: "1",
              rightProgress: "9",
              statTitle: "Offsides",
              ispercent: false,
            ),

            SizedBox(height: 10.0),

            // Red cards
            ComparisonBarWidget(
              id: 'Red Cards',

              leftProgress: "0",
              rightProgress: "0",
              statTitle: "Red cards",
              ispercent: false,
            ),

            SizedBox(height: 10.0),

            // Yellow cards
            ComparisonBarWidget(
              id: 'Yellow Cards',

              leftProgress: "3",
              rightProgress: "7",
              statTitle: "Yellow cards",
              ispercent: false,
            ),

            SizedBox(height: 10.0),

            // Corners
            ComparisonBarWidget(
              id: 'Corners',

              leftProgress: "9",
              rightProgress: "3",
              statTitle: "Corners",
              ispercent: false,
            ),
          ],
        ),
      ),
    );
  }
}
