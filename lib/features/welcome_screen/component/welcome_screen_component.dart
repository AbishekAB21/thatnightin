import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';

class WelcomeScreenComponent extends ConsumerWidget {
  const WelcomeScreenComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor: color.defaultOverlayColor,

      body: Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            RichText(
              text: TextSpan(
                text: 'Welcome to ',
                style: Fontstyles.roboto30px(context, ref, color.plainWhite),
                children: [
                  TextSpan(
                    text: 'ThatNightIn',
                    style: Fontstyles.roboto30px(
                      context,
                      ref,
                      color.secondaryGradient2,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Strictly footy!',
              style: Fontstyles.roboto17Bold(context, ref),
            ),

            SizedBox(height: 10),

            Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(40),
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.bottomCenter,
                    end: Alignment.topRight,
                    tileMode: TileMode.mirror,
                    colors: [
                      color.secondaryGradient1,
                      color.teritiaryColor,
                      color.secondaryGradient2,
                    ],
                  ),
                ),
                child: IconButton(
                  enableFeedback: true,
                  onPressed: () {
                    context.pushReplacement('/signin-screen');
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: color.iconColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
