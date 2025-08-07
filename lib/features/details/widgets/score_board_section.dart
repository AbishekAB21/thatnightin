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
            Text(
              '11th July 2023',
              style: Fontstyles.roboto13px(
                context,
                ref,
              ).copyWith(color: color.plainWhite),
            ),

            Text(
              'Sunday',
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
                        child: Image.asset('assets/images/testCrest1.png'),
                      ),
                      SizedBox(width: 10.0),
                      Flexible(
                        child: Text(
                          'Manchester City',
                          style: Fontstyles.roboto13px(context, ref).copyWith(
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
                  '5-0',
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
                          'Real Madrid',
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
                        child: Image.asset('assets/images/testCrest2.png'),
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
  }
}
