import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/common/providers/theme_provider.dart';

class SquadsTabComponent extends ConsumerWidget {
  const SquadsTabComponent({super.key});

  @override
    Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Center(child: Text('Squads goes here'))],
      ),
    );
  }
}