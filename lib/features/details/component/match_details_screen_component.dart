import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/features/details/widgets/score_board_section.dart';

class MatchDetailsScreenComponent extends ConsumerWidget {
  const MatchDetailsScreenComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor: color.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBar(
          backgroundColor: color.secondaryGradient2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          automaticallyImplyLeading: false,

          flexibleSpace: Stack(
            children: [
              Positioned(
                left: 10,
                top: 50,
                child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: color.plainWhite,
                  ),
                ),
              ),

              ScoreBoardSection(),
            ],
          ),
        ),
      ),
      body: Column(children: [
        
      ],),
    );
  }
}
