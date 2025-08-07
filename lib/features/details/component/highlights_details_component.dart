import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';

class DiscussionComponent extends ConsumerWidget {
  const DiscussionComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ratings", style: Fontstyles.roboto22px(context, ref)),
            SizedBox(height: 10.0),
            SizedBox(
              height: 50,
              child: RatingBar.builder(
                initialRating: 0,
                unratedColor: color.textfieldBackground,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
              
                itemBuilder:
                    (context, index) =>
                        Icon(Icons.star, color: color.secondaryGradient2),
                itemCount: 5,
                onRatingUpdate: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
