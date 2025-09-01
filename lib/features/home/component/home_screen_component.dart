import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thatnightin/features/home/core/database/home_db.dart';
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
            onPressed: () {
              context.push('/settings-screen');
            },
            icon: Icon(Icons.settings_rounded, color: color.iconColor),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: HomeDb().getPostsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: color.secondaryGradient2),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Icon(Icons.error));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("Nothing to see here"));
          }

          final posts = snapshot.data!.docs;
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final post = posts[index].data();
                      return PostWidget(post: post);
                    },
                    separatorBuilder:
                        (context, index) => SizedBox(height: 15.0),
                    itemCount: posts.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
