import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/features/auth/sign%20up/methods/widget_build_methods.dart';
import 'package:thatnightin/features/auth/sign%20up/core/providers/signup_provider.dart';

class SignUpComponent extends ConsumerWidget {
  const SignUpComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    final isNameEntered = ref.watch(ifNameEnteredProvider);
    final TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return SafeArea(
      bottom: false,
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
          backgroundColor: color.background,

          body: Stack(
            children: [
              // Logo
              Align(
                alignment: Alignment.topCenter,
                child: Icon(
                  Icons.sports_soccer_rounded,
                  size: 60,
                  color: color.iconColor,
                ),
              ),

              // Background
              Container(
                padding: EdgeInsets.only(
                  top: 10.0,
                  left: 20.0,
                  right: 20.0,
                  bottom: 70.0,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,

                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/welcomeScreenCover.jpg'),
                    fit: BoxFit.cover,
                    opacity: 0.65,
                  ),
                ),
              ),

              // Need to as for username before displaying the below widget

              // Liquid glass container with mail and password
              isNameEntered
                  ? WidgetBuildMethods().buildSignUpForm(
                    context,
                    ref,
                    emailController,
                    passwordController,
                  )
                  : WidgetBuildMethods().buildNameInput(
                    ref,
                    nameController,
                    context,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
