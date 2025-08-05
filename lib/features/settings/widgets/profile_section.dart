import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';

class ProfileSection extends ConsumerWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Stack(
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

        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 8.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(backgroundColor: color.plainWhite, radius: 40),
                SizedBox(width: 10.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Abishek Aravind',
                      style: Fontstyles.roboto22px(context, ref,),
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      'abishekabofficial@gmail.com',
                      style: Fontstyles.roboto16pxLight(context, ref),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
