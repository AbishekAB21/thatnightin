import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/common/providers/theme_provider.dart';

class ThirdPartySignupButton extends ConsumerWidget {
  final String iconPath;
  final void Function()? onTap;
  const ThirdPartySignupButton({super.key, required this.iconPath, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color.liquidGlassColor,
        ),
        child: Center(
          child: Image.asset( iconPath, height: 40),
        ),
      ),
    );
  }
}
