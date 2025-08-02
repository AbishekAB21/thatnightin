import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';

class ReusableButton extends ConsumerWidget {
  final String buttonTitle;
  final void Function()? onPressed;
  const ReusableButton({super.key, required this.buttonTitle, this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: WidgetStatePropertyAll(6),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
          backgroundColor: WidgetStatePropertyAll(color.secondaryGradient2),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          ),
          overlayColor: WidgetStatePropertyAll(color.textfieldBackground),
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
