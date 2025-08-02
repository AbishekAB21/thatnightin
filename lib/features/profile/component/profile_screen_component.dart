import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/widgets/reusable_button.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/features/profile/widgets/stats_widget.dart';
import 'package:thatnightin/features/my_matches/widgets/my_match_widget.dart';

class ProfileScreenComponent extends ConsumerWidget {
  const ProfileScreenComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor: color.background,
      appBar: AppBar(
        centerTitle: false,
        toolbarHeight: 30,
        backgroundColor: color.background,
        title: Row(
          children: [
            Text(
              'erlingHaalandOfficial',
              style: Fontstyles.roboto18px(context, ref),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.verified_rounded,
              color: color.secondaryGradient2,
              size: 20,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  // Profile section
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: color.secondaryGradient2,
                    backgroundImage: AssetImage(
                      '',
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Erling Haaland',
                          style: Fontstyles.roboto15px(context, ref),
                        ),

                        SizedBox(height: 5),

                        SizedBox(
                          width: 250,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              StatsWidget(count: 115, statName: 'posts'),
                              StatsWidget(count: 115, statName: 'followers'),
                              StatsWidget(count: 115, statName: 'following'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Player for Manchester City & Norway, treble winner, best striker in the world.',
                style: Fontstyles.roboto15px(context, ref),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              SizedBox(height: 10),

              // Follow button
              ReusableButton(buttonTitle: 'Follow', onPressed: () {}),

              SizedBox(height: 30),

              // Posts in a grid
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => MyMatchWidget(matchName: ''),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
