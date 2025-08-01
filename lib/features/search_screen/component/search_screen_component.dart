import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';

class SearchScreenComponent extends ConsumerWidget {
  const SearchScreenComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor: color.background,
      body: Center(child: Text('Search Screen')),
    );
  }
}
