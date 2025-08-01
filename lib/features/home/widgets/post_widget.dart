import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';

class PostWidget extends ConsumerWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: color.secondaryGradient1,
                ),
                SizedBox(width: 10.0),
                Text(
                  "Erlling Haaland",
                  style: Fontstyles.roboto13px(context, ref),
                ),
              ],
            ),

            Row(
              children: [
                IconButton(
                  onPressed: () {
                    // Like post logic
                  },
                  icon: Icon(
                    Icons.favorite_outline_rounded,
                    color: color.iconColor,
                    size: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Add to must watch
                  },
                  icon: Icon(
                    Icons.bookmark_outline_rounded,
                    color: color.iconColor,
                    size: 20,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Navigate to detail screen
                    context.push('/match-detail-screen');
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: color.iconColor,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color.textfieldBackground,

            //TODO: Add a test image
            image: DecorationImage(image: AssetImage(''), fit: BoxFit.cover),
          ),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'That night in Istanbul ',
              style: Fontstyles.roboto13px(context, ref),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
