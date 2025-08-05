import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';

class ReusableButton extends ConsumerWidget {
  final String buttonTitle;
  final void Function()? onPressed;
  final double? customBorderRadius;
  final double? customPaddingHorizontal;
  final double? customPaddingVertical;
  final Color? customoverlayColor;
  final Color? customBackgroundColor;
  const ReusableButton({
    super.key,
    required this.buttonTitle,
    this.onPressed,
    this.customBorderRadius,
    this.customPaddingHorizontal,
    this.customPaddingVertical,
    this.customoverlayColor,
    this.customBackgroundColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: WidgetStatePropertyAll(6),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              vertical: customPaddingVertical ?? 10,
              horizontal: customPaddingHorizontal ?? 20,
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            customBackgroundColor ?? color.secondaryGradient2,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(customBorderRadius ?? 15.0),
            ),
          ),
          overlayColor: WidgetStatePropertyAll(
            customoverlayColor ?? color.textfieldBackground,
          ),
          enableFeedback: true,
          surfaceTintColor: WidgetStatePropertyAll(
            color.background.withValues(alpha: 0.65),
          ),
        ),
        onPressed: onPressed,
        child: Text(buttonTitle, style: Fontstyles.roboto17Bold(context, ref)),
      ),
    );
  }
}
