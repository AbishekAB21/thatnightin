import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/features/details/core/database/details_db.dart';
import 'package:thatnightin/features/details/widgets/comparison_bar_widget.dart';

class StatsTabComponent extends ConsumerWidget {
  final String macthId;
  const StatsTabComponent({super.key, required this.macthId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return StreamBuilder(
      stream: DetailsDb().fetchMatchDetailsWithMatchId(macthId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: color.secondaryGradient2),
          );
        }

        if (snapshot.hasError) {
          return Center(child: Icon(Icons.error));
        }

        final matchStats = snapshot.data!.data();
        final homeStats = matchStats?['stats']?['home']?['stats'];
        final awayStats = matchStats?['stats']?['away']?['stats'];

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

                  leftProgress: homeStats['Ball Possession'],
                  rightProgress: awayStats['Ball Possession'],
                  statTitle: "Possession",
                  ispercent: true,
                ),
                SizedBox(height: 10.0),

                // xG
                ComparisonBarWidget(
                  id: 'xG',

                  leftProgress: (homeStats['expected_goals'] ?? 0).toString(),
                  rightProgress: (awayStats['expected_goals'] ?? 0).toString(),
                  statTitle: "xG",
                  ispercent: false,
                ),

                SizedBox(height: 10.0),

                // Shots
                ComparisonBarWidget(
                  id: 'Shots',

                  leftProgress: (homeStats['Total Shots'] ?? 0).toString(),
                  rightProgress: (awayStats['Total Shots'] ?? 0).toString(),
                  statTitle: "Shots",
                  ispercent: false,
                ),

                SizedBox(height: 10.0),

                // Shots on target
                ComparisonBarWidget(
                  id: 'Shots on target',

                  leftProgress: (homeStats['Shots on Goal'] ?? 0).toString(),
                  rightProgress: (awayStats['Shots on Goal'] ?? 0).toString(),
                  statTitle: "Shots on target",
                  ispercent: false,
                ),

                SizedBox(height: 10.0),

                // Shots inside the box
                ComparisonBarWidget(
                  id: 'Shots inside the box',

                  leftProgress: (homeStats['Shots insidebox'] ?? 0).toString(),
                  rightProgress: (awayStats['Shots insidebox'] ?? 0).toString(),
                  statTitle: "Shots inside the box",
                  ispercent: false,
                ),

                SizedBox(height: 10.0),

                // Shots outside the box
                ComparisonBarWidget(
                  id: 'Shots outside the box',

                  leftProgress: (homeStats['Shots outsidebox'] ?? 0).toString(),
                  rightProgress:
                      (awayStats['Shots outsidebox'] ?? 0).toString(),
                  statTitle: "Shots outside the box",
                  ispercent: false,
                ),

                SizedBox(height: 10.0),

                // Total Passes
                ComparisonBarWidget(
                  id: 'Total passes',

                  leftProgress: (homeStats['Total passes'] ?? 0).toString(),
                  rightProgress: (awayStats['Total passes'] ?? 0).toString(),
                  statTitle: "Total passes",
                  ispercent: false,
                ),

                SizedBox(height: 10.0),

                // Passes Accuracy
                ComparisonBarWidget(
                  id: 'Pass Accuracy',

                  leftProgress: homeStats['Passes %'],
                  rightProgress: awayStats['Passes %'],
                  statTitle: "Pass Accuracy",
                  ispercent: true,
                ),

                SizedBox(height: 10.0),

                // Offsides
                ComparisonBarWidget(
                  id: 'Offsides',

                  leftProgress: (homeStats['Offsides'] ?? 0).toString(),
                  rightProgress: (awayStats['Offsides'] ?? 0).toString(),
                  statTitle: "Offsides",
                  ispercent: false,
                ),

                SizedBox(height: 10.0),

                // Red cards
                ComparisonBarWidget(
                  id: 'Red Cards',

                  leftProgress: (homeStats['Red Cards'] ?? 0).toString(),
                  rightProgress: (awayStats['Red Cards'] ?? 0).toString(),
                  statTitle: "Red cards",
                  ispercent: false,
                ),

                SizedBox(height: 10.0),

                // Yellow cards
                ComparisonBarWidget(
                  id: 'Yellow Cards',

                  leftProgress: (homeStats['Yellow Cards'] ?? 0).toString(),
                  rightProgress: (awayStats['Yellow Cards'] ?? 0).toString(),
                  statTitle: "Yellow cards",
                  ispercent: false,
                ),

                SizedBox(height: 10.0),

                // Corners
                ComparisonBarWidget(
                  id: 'Corners',

                  leftProgress: (homeStats['Corner Kicks'] ?? 0).toString(),
                  rightProgress: (awayStats['Corner Kicks'] ?? 0).toString(),
                  statTitle: "Corners",
                  ispercent: false,
                ),

                SizedBox(height: 10.0),

                // Saves
                ComparisonBarWidget(
                  id: 'Saves',

                  leftProgress: (homeStats['Goalkeeper Saves'] ?? 0).toString(),
                  rightProgress:
                      (awayStats['Goalkeeper Saves'] ?? 0).toString(),
                  statTitle: "Saves",
                  ispercent: false,
                ),

                SizedBox(height: 10.0),

                // Fouls
                ComparisonBarWidget(
                  id: 'Fouls',

                  leftProgress: (homeStats['Fouls'] ?? 0).toString(),
                  rightProgress: (awayStats['Fouls'] ?? 0).toString(),
                  statTitle: "Fouls",
                  ispercent: false,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
