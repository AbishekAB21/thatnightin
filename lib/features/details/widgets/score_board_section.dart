import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';

class ScoreBoardSection extends ConsumerWidget {
  const ScoreBoardSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
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
            Text('11th July 2023', style: Fontstyles.roboto13px(context, ref)),

            Text('Sunday', style: Fontstyles.roboto13px(context, ref)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Home team
                Row(
                  children: [
                    CircleAvatar(radius: 20),
                    SizedBox(width: 10.0),
                    Text(
                      'Home Team',
                      style: Fontstyles.roboto17Bold(context, ref),
                    ),
                  ],
                ),

                // Score
                Text('5-5', style: Fontstyles.roboto25px(context, ref)),

                // Away team
                Row(
                  children: [
                    Text(
                      'Away Team',
                      style: Fontstyles.roboto17Bold(context, ref),
                    ),
                    SizedBox(width: 10.0),
                    CircleAvatar(radius: 20),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
