import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thatnightin/common/widgets/top_snackbar.dart';
import 'package:thatnightin/common/widgets/reusable_snackbar.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/features/auth/sign%20in/core/database/sign_in_db.dart';
import 'package:thatnightin/features/auth/sign%20in/widgets/liquid_glass_container.dart';

class SignInComponent extends ConsumerStatefulWidget {
  const SignInComponent({super.key});

  @override
  ConsumerState<SignInComponent> createState() => _SignUpComponentState();
}

class _SignUpComponentState extends ConsumerState<SignInComponent> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = ref.watch(themeProvider);
    return SafeArea(
      bottom: false,
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
          backgroundColor: color.defaultOverlayColor,

          body: Stack(
            children: [
              // Background image
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/welcomeScreenCover.jpg'),
                    fit: BoxFit.cover,
                    opacity: 0.65,
                  ),
                ),
              ),

              // Content (logo)
              Align(
                alignment: Alignment.topCenter,
                child: Icon(
                  Icons.sports_soccer_rounded,
                  size: 60,
                  color: color.plainWhite,
                ),
              ),

              LiquidGlassAuthContaner(
                headertext: 'Sign In',
                textfieldLabel1: 'Email',
                textfieldLabel2: 'Password',
                emailController: emailController,
                passwordController: passwordController,

                bottomWidget: Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      text: 'New around here? ',
                      style: Fontstyles.roboto16pxLight(context, ref),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: Fontstyles.roboto16pxSemiBoldBlue(
                            context,
                            ref,
                          ),
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  context.push('/signup-screen');
                                },
                        ),
                      ],
                    ),
                  ),
                ),
                onAuthenticateUserPressed: () async {
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    try {
                      SignInDb().signInUserWithEmailAndPassword(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                      ShowCustomSnackbar().showSnackbar(
                        context,
                        'Signed in!',
                        color.successColor,
                        ref,
                      );
                      context.go('/home-screen');
                    } catch (e) {
                      TopSnackbar().showTopSnackbar(
                        'Something went wrong: $e',
                        context,
                        color.errorColor,
                        Fontstyles.roboto15px(context, ref),
                      );
                    }
                  } else {
                    TopSnackbar().showTopSnackbar(
                      'Please fill all the fields',
                      context,
                      color.errorColor,
                      Fontstyles.roboto15px(context, ref),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
