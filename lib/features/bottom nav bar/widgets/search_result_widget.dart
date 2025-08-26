import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';

class SearchResultWidget extends ConsumerWidget {
  final String homeTeam;
  final String awayTeam;
  final String date;
  const SearchResultWidget({
    super.key,
    required this.awayTeam,
    required this.homeTeam,
    required this.date,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color.textfieldBackground,
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            height: 70,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular((10.0)),
              gradient: LinearGradient(
                colors: [
                  color.secondaryGradient1,
                  color.secondaryGradient2,
                  color.teritiaryColor,
                ],
              ),
            ),
            child: Icon(
              Icons.sports_soccer_rounded,
              color: color.iconColor,
              size: 30,
            ),
          ),
          SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$homeTeam vs $awayTeam',
                  style: Fontstyles.roboto18px(context, ref),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 10.0),
                Text(
                  'UEFA Champions League',
                  style: Fontstyles.roboto13px(context, ref),
                ),
                SizedBox(height: 5.0),
                Text(date, style: Fontstyles.roboto13px(context, ref)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
