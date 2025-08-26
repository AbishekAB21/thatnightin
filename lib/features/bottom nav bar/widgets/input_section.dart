import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/common/widgets/reusable_textfield.dart';
import 'package:thatnightin/features/home/core/providers/home_provider.dart';
import 'package:thatnightin/features/home/core/providers/home_search_state_provider.dart';
import 'package:thatnightin/common/widgets/reusable_textfield_without_prefix_suffix.dart';
import 'package:thatnightin/features/bottom%20nav%20bar/widgets/search_result_widget.dart';
import 'package:thatnightin/features/bottom%20nav%20bar/widgets/selected_match_widget.dart';

class InputSection extends ConsumerWidget {
  final TextEditingController searchController;
  final TextEditingController captionController;
  const InputSection({
    super.key,
    required this.captionController,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    final results = ref.watch(homeSearchResultsProvider);
    final notifier = ref.read(homeSearchResultsProvider.notifier);
    final selectedMatch = ref.watch(selectedMatchProvider);

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Pick the match',
                style: Fontstyles.roboto17Bold(context, ref),
              ),
            ),
            SizedBox(height: 10.0),
            ReusableTextfield(
              hintText: 'Pick the match',
              controller: searchController,
              onChanged: (value) {
                ref
                    .read(homeSearchResultsProvider.notifier)
                    .searchMatches(value);
              },
            ),
            SizedBox(height: 10.0),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final match = results[index];
                final homeTeam = match["teams"]["home"]["name"];
                final awayTeam = match["teams"]["away"]["name"];
                final date = match["fixture"]["date"];
                final fixtureId = match["fixture"]["id"];

                return InkWell(
                  onTap: () async {
                    final stats = await ref
                        .read(homeServiceProvider)
                        .getMatchStats(fixtureId);

                    // ref.read(selectedMatchProvider.notifier).state =
                    //     selectedMatch;
                    
                    ref.read(selectedMatchProvider.notifier).state = {
                      "fixture" : match["fixture"],
                      "fixtureId" : fixtureId,
                      "homeTeam" : homeTeam,
                      "awayTeam" : awayTeam,
                      "date" : date,
                      "league" : match["league"],
                      "stats" : stats,
                    };

                    // Clear Search
                    searchController.clear();

                    // Close list - clears provider
                    ref.invalidate(homeSearchResultsProvider);
                  },
                  child: SearchResultWidget(
                    awayTeam: awayTeam,
                    homeTeam: homeTeam,
                    date: date,
                  ),
                );
              },
              itemCount: results.length,
            ),

            // View more
            if (notifier.canLoadMore)
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: TextButton(
                  onPressed: () {
                    notifier.loadMore();
                  },
                  child: Text(
                    "View more",
                    style: Fontstyles.roboto16pxSemiBoldBlue(context, ref),
                  ),
                ),
              ),

            // Selected match
            if (selectedMatch != null)
              SelectedMatchWidget(match: selectedMatch),

            SizedBox(height: 20.0),

            // Post inputs
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Add a caption',
                style: Fontstyles.roboto17Bold(context, ref),
              ),
            ),
            SizedBox(height: 10.0),
            ReusableTextfieldWithoutPrefixSuffix(
              hintText: 'Add a caption',
              controller: captionController,
              maxlines: 3,
            ),
            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Add an image',
                style: Fontstyles.roboto17Bold(context, ref),
              ),
            ),
            SizedBox(height: 10.0),

            // Adjust the bottom container to display the selected image once selected
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: color.textfieldBackground2),
              ),
              child: Center(
                child: IconButton.outlined(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: color.textfieldBackground),
                      ),
                    ),
                  ),

                  onPressed: () {},
                  icon: Icon(
                    Icons.image_rounded,
                    color: color.secondaryGradient2,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
