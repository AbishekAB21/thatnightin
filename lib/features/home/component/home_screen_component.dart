import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/features/home/widgets/post_widget.dart';

class HomeScreenComponent extends ConsumerWidget {
  const HomeScreenComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor: color.background,
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: color.background,
        title: Text(
          'That Night In..',
          style: Fontstyles.roboto20px(context, ref),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings_rounded, color: color.iconColor),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => PostWidget(),
                separatorBuilder: (context, index) => SizedBox(height: 15.0),
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
