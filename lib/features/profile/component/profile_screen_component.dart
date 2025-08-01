import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/features/profile/widgets/stats_widget.dart';
import 'package:thatnightin/utils/fontstyles/fontstyles.dart';

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
        title: Text(
          'erlingHaalandOfficial',
          style: Fontstyles.roboto18px(context, ref),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                // Profile section
                CircleAvatar(
                  radius: 30,
                  backgroundColor: color.secondaryGradient2,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Erling Haaland',
                        style: Fontstyles.roboto13px(context, ref),
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

            SizedBox(height: 30),

            // Posts in a grid
          ],
        ),
      ),
    );
  }
}
