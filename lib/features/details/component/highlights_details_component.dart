import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/features/details/widgets/comments_builder_widget.dart';
import 'package:thatnightin/common/widgets/reusable_textfield_without_prefix_suffix.dart';

class DiscussionComponent extends ConsumerWidget {
  const DiscussionComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    TextEditingController commentController = TextEditingController();
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Overall rating",
                style: Fontstyles.roboto22px(context, ref),
              ),
              SizedBox(height: 10.0),
              SizedBox(
                height: 50,
                child: RatingBar.builder(
                  initialRating: 0,
                  unratedColor: color.textfieldBackground,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemSize: 40.0,
                  itemBuilder:
                      (context, index) =>
                          Icon(Icons.star_outlined, color: color.warningColor),
                  itemCount: 5,
                  onRatingUpdate: (value) {},
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '4.5',
                  style: Fontstyles.roboto16pxSemiBoldBlue(context, ref),
                  children: [
                    TextSpan(
                      text: ' •',
                      style: Fontstyles.roboto16pxSemiBold(context, ref),
                    ),
                    TextSpan(
                      text: ' 450 comments',
                      style: Fontstyles.roboto16pxSemiBold(context, ref),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30.0),
              // Add your rating and comment
              ReusableTextfieldWithoutPrefixSuffix(
                hintText: 'Add a comment',
                controller: commentController,
                maxlines: 5,
              ),

              SizedBox(height: 20.0),

              // Show other comment and ratings
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '450 comments',
                    style: Fontstyles.roboto16pxSemiBold(context, ref),
                  ),

                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.sort, color: color.secondaryGradient2),
                    label: Text(
                      'Sort by Latest',
                      style: Fontstyles.roboto16pxSemiBold(context, ref),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.0),

              ListView.separated(
                itemBuilder: (context, index) => CommentsBuilderWidget(),
                separatorBuilder: (context, index) => SizedBox(height: 16.0),
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
