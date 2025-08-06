import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/features/details/widgets/squad_builder_widget.dart';

class SquadsTabComponent extends ConsumerWidget {
  const SquadsTabComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            labelColor: color.secondaryGradient2,
            dividerColor: color.textfieldBackground.withValues(alpha: 0.65),
            indicatorColor: color.secondaryGradient2,
            labelStyle: Fontstyles.roboto16pxSemiBold(context, ref),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2.0,
            tabAlignment: TabAlignment.fill,
            overlayColor: WidgetStatePropertyAll(color.textfieldBackground2),
            unselectedLabelColor: color.iconColor,

            tabs: [Tab(text: 'Manchester City'), Tab(text: 'Real Madrid')],
          ),

          Expanded(
            child: TabBarView(
              children: [
                // Home team
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: SquadBuilderWidget(),
                  ),
                ),

                // Away team
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: SquadBuilderWidget(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
