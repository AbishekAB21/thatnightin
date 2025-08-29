import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/features/home/core/providers/home_provider.dart';

class PickImageWidget extends ConsumerWidget {
  const PickImageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: color.textfieldBackground2),
      ),
      child: Center(
        child: IconButton.outlined(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: color.textfieldBackground),
              ),
            ),
          ),

          onPressed: () {
            ref.read(imageControllerProvider).pickImage();
          },
          icon: Icon(
            Icons.image_rounded,
            color: color.secondaryGradient2,
            size: 30,
          ),
        ),
      ),
    );
  }
}
