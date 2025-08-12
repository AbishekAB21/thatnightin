import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:thatnightin/features/bottom%20nav%20bar/widgets/new_post_sheet.dart';
import 'package:thatnightin/features/bottom%20nav%20bar/core/providers/main_shell_provider.dart';

class MainShellComponent extends ConsumerWidget {
  final Widget child;
  const MainShellComponent({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchController = TextEditingController();
    final TextEditingController captionController = TextEditingController();
    final color = ref.watch(themeProvider);
    final currentIndex = ref.watch(tabIndexProvider);
    final tabs = [
      '/home-screen',
      '/search-screen',
      '/mymatches-screen',
      '/profile-screen',
    ];
    return Scaffold(
      body: child,

      floatingActionButton: FloatingActionButton(
        elevation: 6,
        shape: CircleBorder(),
        backgroundColor: color.secondaryGradient2,
        onPressed: () {
          NewPostWidget().showPostBottomSheet(
            context,
            ref,
            searchController,
            captionController,
          );
        },
        child: Icon(Icons.add_rounded),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: 50,
        gapLocation: GapLocation.center,
        backgroundColor: color.background,
        activeColor: color.secondaryGradient1,
        elevation: 6,
        blurEffect: true,

        icons: const [
          Icons.home_rounded,
          Icons.search_rounded,
          Icons.bookmark_rounded,
          Icons.person_rounded,
        ],
        activeIndex: currentIndex,
        onTap: (index) {
          ref.read(tabIndexProvider.notifier).state = index;
          context.go(tabs[index]);
        },
      ),
    );
  }
}
