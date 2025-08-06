import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/features/details/widgets/progress_bar_widget.dart';

class StatsTabComponent extends ConsumerWidget {
  const StatsTabComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            /// TODO : Write a method to calculate home team percentage and pass it to "homeTeamStat:"

            // Possession
            ProgressBarWidget(
              homeTeamStat:
                  0.75, // Pass the home team's stat here as its left allinged
              leftProgress: "75",
              rightProgress: "25",
              statTitle: "Possession",
              ispercent: true,
            ),

            SizedBox(height: 10.0),

            // Shots
            ProgressBarWidget(
              homeTeamStat:
                  0.63, // Pass the home team's stat here as its left allinged
              leftProgress: "25",
              rightProgress: "15",
              statTitle: "Shots",
              ispercent: false,
            ),

            SizedBox(height: 10.0),

            // Shots on target
            ProgressBarWidget(
              homeTeamStat:
                  0.80, // Pass the home team's stat here as its left allinged
              leftProgress: "8",
              rightProgress: "2",
              statTitle: "Shots on target",
              ispercent: false,
            ),

            SizedBox(height: 10.0),

            // Passes Accuracy
            ProgressBarWidget(
              homeTeamStat:
                  0.60, // Pass the home team's stat here as its left allinged
              leftProgress: "60",
              rightProgress: "40",
              statTitle: "Pass Accuracy",
              ispercent: true,
            ),

            SizedBox(height: 10.0),

            // Offsides
            ProgressBarWidget(
              homeTeamStat:
                  0.10, // Pass the home team's stat here as its left allinged as percent
              leftProgress: "1",
              rightProgress: "9",
              statTitle: "Offsides",
              ispercent: false,
            ),

            SizedBox(height: 10.0),

            // Red cards
            ProgressBarWidget(
              homeTeamStat:
                  0.00, // Pass the home team's stat here as its left allinged
              leftProgress: "0",
              rightProgress: "0",
              statTitle: "Red cards",
              ispercent: false,
            ),

            SizedBox(height: 10.0),

            // Yellow cards
            ProgressBarWidget(
              homeTeamStat:
                  0.30, // Pass the home team's stat here as its left allinged
              leftProgress: "3",
              rightProgress: "7",
              statTitle: "Yellow cards",
              ispercent: false,
            ),

            SizedBox(height: 10.0),

            // Corners
            ProgressBarWidget(
              homeTeamStat:
                  0.82, // Pass the home team's stat here as its left allinged
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
