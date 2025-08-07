import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/common/providers/theme_provider.dart';

class CustomComparisonBar extends ConsumerWidget {
  final double leftPercent;
  final double rightPercent;
  final Color leftColor;
  final Color rightColor;
  final Duration duration;
  const CustomComparisonBar({
    super.key,
    required this.leftPercent,
    required this.rightPercent,
    required this.leftColor,
    required this.rightColor,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return LayoutBuilder(
      builder: (context, constraints) {
        final total = leftPercent + rightPercent;
        final normalizedLeft = total == 0 ? 0.0 : leftPercent / total;
        final normalizedRight = total == 0 ? 0.0 : rightPercent / total;

        final totalWidth = constraints.maxWidth;
        final leftWidth = totalWidth * normalizedLeft;
        final rightWidth = totalWidth * normalizedRight;

        return Row(
          children: [
            AnimatedContainer(
              duration: duration,
              width: leftWidth != 0 ? leftWidth : totalWidth / 2,
              curve: Curves.easeInOut,
              height: 20,

              decoration: BoxDecoration(
                color: leftWidth != 0 ? leftColor : color.textfieldBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                border: Border(
                  right: BorderSide(
                    color: color.background,
                    width: rightWidth == 0 ? 0 : 4,
                  ),
                ),
              ),
            ),

            AnimatedContainer(
              duration: duration,
              width: rightWidth != 0 ? rightWidth : totalWidth / 2,
              curve: Curves.easeInOut,
              height: 20,
              decoration: BoxDecoration(
                color: rightWidth != 0 ? rightColor : color.textfieldBackground,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                border: Border(
                  left: BorderSide(
                    color: color.background,
                    width: leftWidth == 0 ? 0 : 4,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
