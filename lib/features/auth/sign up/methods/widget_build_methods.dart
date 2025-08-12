import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thatnightin/common/widgets/reusable_snackbar.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/widgets/reusable_button.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/common/widgets/reusable_textfield.dart';
import 'package:thatnightin/features/auth/sign%20up/core/database/sign_up_db.dart';
import 'package:thatnightin/features/auth/sign%20in/widgets/liquid_glass_container.dart';
import 'package:thatnightin/features/auth/sign%20up/core/providers/signup_provider.dart';
import 'package:thatnightin/features/auth/sign%20up/widgets/third_party_signup_button.dart';

class WidgetBuildMethods {
  Widget buildNameInput(
    WidgetRef ref,
    TextEditingController controller,
    BuildContext context,
  ) {
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
              decoration: BoxDecoration(
                color: color.liquidGlassColor,
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: color.liquidGlassColor),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'What\'s your name?',
                    style: Fontstyles.roboto22px(context, ref),
                  ),
                  SizedBox(height: 10.0),
                  ReusableTextfield(
                    hintText: 'Name',
                    prefixIcon: Icons.person,
                    controller: controller,
                  ),
                  SizedBox(height: 20),
                  ReusableButton(
                    buttonTitle: 'Proceed',
                    customBorderRadius: 10.0,
                    onPressed: () {
                      if (controller.text.trim().isNotEmpty) {
                        ref.read(enterednameProvider.notifier).state =
                            controller.text.trim();
                        ref.read(ifNameEnteredProvider.notifier).state = true;
                      }
                    },
                  ),
                  SizedBox(height: 10.0),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: Fontstyles.roboto16pxLight(context, ref),
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: Fontstyles.roboto16pxSemiBoldBlue(
                              context,
                              ref,
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    ref
                                        .read(ifNameEnteredProvider.notifier)
                                        .state = false;
                                    context.pop();
                                  },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSignUpForm(
    BuildContext context,
    WidgetRef ref,
    String username,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) {
    final color = ref.watch(themeProvider);
    return LiquidGlassAuthContaner(
      headertext: 'Sign Up',
      textfieldLabel1: 'Email',
      textfieldLabel2: 'Password',
      emailController: emailController,
      passwordController: passwordController,
      bottomWidget: Column(
        children: [
          Text('Or', style: Fontstyles.roboto16pxSemiBold(context, ref)),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ThirdPartySignupButton(
                iconPath: 'assets/images/google.png',
                onTap: () {
                  // Google Sign in
                },
              ),
              SizedBox(width: 25.0),
              ThirdPartySignupButton(
                iconPath: 'assets/images/apple-logo.png',
                onTap: () {
                  // Apple Sign in
                },
              ),
            ],
          ),
          SizedBox(height: 15.0),

          Align(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                text: 'Already have an account? ',
                style: Fontstyles.roboto16pxLight(context, ref),
                children: [
                  TextSpan(
                    text: 'Sign In',
                    style: Fontstyles.roboto16pxSemiBoldBlue(context, ref),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            context.pop();
                          },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      onAuthenticateUserPressed: () async {
        try {
          SignUpDb().createUserEmailPassword(
            username,
            emailController.text.trim(),
            passwordController.text.trim(),
            context,
            ref,
          );
          context.pop();
          ref.read(ifNameEnteredProvider.notifier).state = false;

          if (context.mounted) {
            ShowCustomSnackbar().showSnackbar(
              context,
              'Account Created - Please Sign in',
              color.successColor,
              ref,
            );
          }
        } catch (e) {
          if (context.mounted) {
            ShowCustomSnackbar().showSnackbar(
              context,
              'Something went wrong: $e',
              color.errorColor,
              ref,
            );
          }
        }
      },
    );
  }
}
