import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/features/my_matches/widgets/my_match_widget.dart';

class MyMatchesComponent extends ConsumerWidget {
  const MyMatchesComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor: color.background,
      appBar: AppBar(
        toolbarHeight: 20,
        backgroundColor: color.background,
        title: Text('Watchlist', style: Fontstyles.roboto20px(context, ref)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 5,
                  childAspectRatio: 3 / 4,
                ),
                itemBuilder:
                    (context, index) => MyMatchWidget(
                      matchName: 'Manchecter City vs Inter Milan',
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
