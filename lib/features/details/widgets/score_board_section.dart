import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thatnightin/features/details/core/database/details_db.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';

class ScoreBoardSection extends ConsumerWidget {
  final String matchId;
  const ScoreBoardSection({super.key, required this.matchId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return StreamBuilder(
      stream: DetailsDb().fetchMatchDetailsWithMatchId(matchId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        final matchStats = snapshot.data!.data();
        final homeTeamName = matchStats?['stats']?['home']?['name'];
        final awayTeamName = matchStats?['stats']?['away']?['name'];
        final homeGoals = matchStats?['stats']?['home']?['goals'];
        final awayGoals = matchStats?['stats']?['away']?['goals'];
        final homeLogo = matchStats?['stats']?['home']?['logo'];
        final awayLogo = matchStats?['stats']?['away']?['logo'];
        final competitionName = matchStats?['league']?['name'];
        final season = matchStats?['league']?['season'];

        return Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.sports_soccer_rounded,
                  color: color.plainWhite,
                  size: 40,
                ),
                SizedBox(height: 10),
                Text(
                  competitionName,
                  style: Fontstyles.roboto13px(
                    context,
                    ref,
                  ).copyWith(color: color.plainWhite),
                ),

                Text(
                  season.toString(),
                  style: Fontstyles.roboto13px(
                    context,
                    ref,
                  ).copyWith(color: color.plainWhite),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Home team
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: color.transparent,
                            child: Image.network(homeLogo),
                          ),
                          SizedBox(width: 10.0),
                          Flexible(
                            child: Text(
                              '$homeTeamName',
                              style: Fontstyles.roboto13px(
                                context,
                                ref,
                              ).copyWith(
                                color: color.plainWhite,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 10.5),

                    // Score
                    Text(
                      '$homeGoals-$awayGoals',
                      style: Fontstyles.roboto25px(
                        context,
                        ref,
                      ).copyWith(color: color.plainWhite),
                    ),

                    // Away team
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Text(
                              '$awayTeamName',
                              style: Fontstyles.roboto13px(
                                context,
                                ref,
                              ).copyWith(color: color.plainWhite),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: color.transparent,
                            child: Image.network(awayLogo),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
