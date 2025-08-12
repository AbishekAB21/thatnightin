import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thatnightin/common/providers/visibility_provider.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';

class ReusableTextfield extends ConsumerWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int? maxlines;
  final TextEditingController controller;
  final bool? isObscure;
  const ReusableTextfield({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.maxlines,
    required this.controller,
    this.isObscure = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVisible = ref.watch(visibilityProvider);
    final color = ref.watch(themeProvider);
    return TextFormField(
      //TODO: add controller
      controller: controller,
      maxLines: maxlines ?? 1,
      obscureText: isObscure! && !isVisible,
      style: Fontstyles.roboto15px(context, ref),
      cursorColor: color.secondaryGradient2,
      decoration: InputDecoration(
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color.secondaryGradient2),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color.textfieldBackground2),
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: color.textfieldBackground.withValues(alpha: 0.65),
        filled: true,
        hintText: hintText,
        hintStyle: Fontstyles.roboto12Hintpx(context, ref),

        prefixIcon: Icon(
          prefixIcon ?? Icons.search_rounded,
          color: color.iconColor,
          size: 25,
        ),

        suffixIcon: InkWell(
          onTapUp:
              (details) => ref.read(visibilityProvider.notifier).state = false,
          onTapDown:
              (details) => ref.read(visibilityProvider.notifier).state = true,
          onTapCancel:
              () => ref.read(visibilityProvider.notifier).state = false,
          child: Icon(suffixIcon),
        ),
        hintFadeDuration: Duration(milliseconds: 500),
      ),
    );
  }
}
