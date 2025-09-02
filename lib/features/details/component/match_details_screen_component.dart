import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/features/details/widgets/score_board_section.dart';
import 'package:thatnightin/features/details/container/stats_tab_container.dart';
import 'package:thatnightin/features/details/container/squads_tab_container.dart';
import 'package:thatnightin/features/details/container/highlights_tab_container.dart';

class MatchDetailsScreenComponent extends ConsumerWidget {
  final String matchId;
  const MatchDetailsScreenComponent({super.key, required this.matchId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: color.background,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(300),
          child: AppBar(
            backgroundColor: color.secondaryGradient2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            automaticallyImplyLeading: false,

            flexibleSpace: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    color: color.defaultOverlayColor,
                    image: DecorationImage(
                      image: AssetImage('assets/images/welcomeScreenCover.jpg'),
                      fit: BoxFit.cover,
                      opacity: 0.7,
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 50,
                  child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: color.plainWhite,
                    ),
                  ),
                ),

                ScoreBoardSection(matchId: matchId,),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          child: Column(
            children: [
              TabBar(
                labelColor: color.secondaryGradient2,
                dividerColor: color.textfieldBackground.withValues(alpha: 0.65),
                indicatorColor: color.secondaryGradient2,
                labelStyle: Fontstyles.roboto16pxSemiBold(context, ref),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 2.0,
                tabAlignment: TabAlignment.fill,
                overlayColor: WidgetStatePropertyAll(
                  color.textfieldBackground2,
                ),
                unselectedLabelColor: color.iconColor,

                tabs: [
                  Tab(text: 'Stats'),
                  Tab(text: 'Squads'),
                  Tab(text: 'Discussion'),
                ],
              ),

              Expanded(
                child: TabBarView(
                  children: [
                    // Stats
                    StatsTabContainer(matchId: matchId),

                    // Squads
                    SquadsTabContainer(matchId: matchId),

                    // Highlights
                    DiscussionContainer(matchId: matchId),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
