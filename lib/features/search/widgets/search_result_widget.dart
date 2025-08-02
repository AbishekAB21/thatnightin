import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';

class SearchResultWidget extends ConsumerWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return GestureDetector(
      
      onTap: () => context.push('/match-detail-screen'),
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color.textfieldBackground,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: color.secondaryGradient2.withValues(alpha: 0.8),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Manchester City vs Inter Milan',
                  style: Fontstyles.roboto18px(context, ref),
                ),
                SizedBox(height: 10.0),
                Text(
                  'UEFA Champions League',
                  style: Fontstyles.roboto13px(context, ref),
                ),
                SizedBox(height: 5.0),
                Text('11 July 2023', style: Fontstyles.roboto13px(context, ref)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
