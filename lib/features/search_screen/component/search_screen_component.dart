import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/common/widgets/reusable_textfield.dart';
import 'package:thatnightin/features/search_screen/widgets/search_result_widget.dart';

class SearchScreenComponent extends ConsumerWidget {
  const SearchScreenComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: color.background,
        appBar: AppBar(
          backgroundColor: color.background,
          toolbarHeight: 20,
          title: Text('Search', style: Fontstyles.roboto20px(context, ref)),
        ),

        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              ReusableTextfield(hintText: 'Search for matches or users'),
              SizedBox(height: 20),

              // Search result widget
              Expanded(
                child: ListView.separated(
                  itemBuilder:
                      (context, index) =>
                          SearchResultWidget(/* Pass data here */),
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemCount: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
