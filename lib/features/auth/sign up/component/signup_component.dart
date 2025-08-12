import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/features/auth/sign%20up/methods/widget_build_methods.dart';
import 'package:thatnightin/features/auth/sign%20up/core/providers/signup_provider.dart';

class SignUpComponent extends ConsumerStatefulWidget {
  const SignUpComponent({super.key});

  @override
  ConsumerState<SignUpComponent> createState() => _SignUpComponentState();
}

class _SignUpComponentState extends ConsumerState<SignUpComponent> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = ref.watch(themeProvider);
    final isNameEntered = ref.watch(ifNameEnteredProvider);

    return SafeArea(
      bottom: false,
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
          backgroundColor: color.defaultOverlayColor,

          body: Stack(
            children: [
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

              // Logo
              Align(
                alignment: Alignment.topCenter,
                child: Icon(
                  Icons.sports_soccer_rounded,
                  size: 60,
                  color: color.plainWhite,
                ),
              ),

              // Need to as for username before displaying the below widget

              // Liquid glass container with mail and password
              isNameEntered
                  ? WidgetBuildMethods().buildSignUpForm(
                    context,
                    ref,
                    nameController.text.trim(),
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
