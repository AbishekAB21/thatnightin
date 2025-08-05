import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';

class MyMatchWidget extends ConsumerWidget {
  final String matchName;
  const MyMatchWidget({super.key, required this.matchName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Container(
            height: 250,
            width: 180,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color.defaultOverlayColor,
              image: DecorationImage(
                image: AssetImage('assets/images/test_image.jpg'),
                fit: BoxFit.cover,
                opacity: 0.7,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  matchName,
                  style: Fontstyles.roboto10px(
                    context,
                    ref,
                  ).copyWith(color: color.background),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
