import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/features/auth/sign%20in/widgets/liquid_glass_container.dart';

class SigInComponent extends ConsumerWidget {
  const SigInComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
                onAuthenticateUserPressed: () {
                  context.pushReplacement('/home-screen');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
