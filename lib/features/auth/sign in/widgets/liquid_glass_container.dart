import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/widgets/reusable_button.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/common/widgets/reusable_textfield.dart';

class LiquidGlassAuthContaner extends ConsumerWidget {
  final String headertext;
  final String textfieldLabel1;
  final String textfieldLabel2;
  final Widget bottomWidget;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function()? onAuthenticateUserPressed;
  const LiquidGlassAuthContaner({
    super.key,
    required this.headertext,
    required this.textfieldLabel1,
    required this.textfieldLabel2,
    required this.bottomWidget,
    required this.emailController,
    required this.passwordController,
    required this.onAuthenticateUserPressed
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.all(0.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              padding: EdgeInsets.only(
                top: 12.0,
                right: 12.0,
                left: 12.0,
                bottom: 20.0,
              ),
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height / 1.9,
              decoration: BoxDecoration(
                color: color.liquidGlassColor,
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: color.liquidGlassColor),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      headertext,
                      style: Fontstyles.roboto35px(context, ref),
                    ),
                  ),

                  SizedBox(height: 20),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      textfieldLabel1,
                      style: Fontstyles.roboto17Bold(context, ref),
                    ),
                  ),
                  SizedBox(height: 5.0),

                  ReusableTextfield(
                    controller: emailController,
                    hintText: textfieldLabel1,
                    prefixIcon: Icons.email_rounded,
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      textfieldLabel2,
                      style: Fontstyles.roboto17Bold(context, ref),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  ReusableTextfield(
                    controller: passwordController,
                    hintText: textfieldLabel2,
                    prefixIcon: Icons.lock_rounded,
                    suffixIcon: Icons.remove_red_eye_outlined,
                  ),
                  SizedBox(height: 5.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot password?',
                      style: Fontstyles.roboto16pxSemiBold(context, ref),
                    ),
                  ),
                  SizedBox(height: 30),
                  ReusableButton(
                    buttonTitle: 'Sign In',
                    customBorderRadius: 10,
                    customPaddingVertical: 13,
                    onPressed: onAuthenticateUserPressed,
                  ),

                  SizedBox(height: 20),
                  bottomWidget
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
