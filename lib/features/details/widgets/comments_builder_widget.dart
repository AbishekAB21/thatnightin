import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';

class CommentsBuilderWidget extends ConsumerWidget {
  const CommentsBuilderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color.textfieldBackground.withValues(alpha: 0.65),
        border: Border.all(color: color.textfieldBackground2),
        borderRadius: BorderRadius.circular(10.0),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: color.secondaryGradient2,
              ),
              SizedBox(width: 7.0),
              Text(
                'Erling Haaland',
                style: Fontstyles.roboto13px(context, ref),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          SizedBox(
            height: 30,
            child: RatingBar.builder(
              initialRating: 0,
              unratedColor: color.textfieldBackground,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemSize: 20.0,
              itemBuilder:
                  (context, index) =>
                      Icon(Icons.star_outlined, color: color.warningColor),
              itemCount: 5,
              onRatingUpdate: (value) {},
            ),
          ),
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
          ),
        ],
      ),
    );
  }
}
