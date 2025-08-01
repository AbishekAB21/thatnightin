import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thatnightin/utils/fontstyles/fontstyles.dart';

class StatsWidget extends ConsumerWidget {
  final int count;
  final String statName;
  const StatsWidget({super.key, required this.count, required this.statName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(count.toString(), style: Fontstyles.roboto15px(context, ref)),
        Text(statName, style: Fontstyles.roboto13px(context, ref)),
      ],
    );
  }
}
