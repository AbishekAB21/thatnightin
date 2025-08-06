import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/utils/fontstyles/fontstyles.dart';

class StatsTabComponent extends ConsumerWidget {
  const StatsTabComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Possession',
                style: Fontstyles.roboto18px(context, ref),
              ),
            ),
            SizedBox(height: 10.0,),
            LinearProgressIndicator(value: 0,)
          ],
        ),
      ),
    );
  }
}
