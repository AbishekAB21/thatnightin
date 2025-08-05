import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/common/widgets/logo.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';

class SplashScreenComponent extends ConsumerStatefulWidget {
  const SplashScreenComponent({super.key});

  @override
  ConsumerState<SplashScreenComponent> createState() =>
      _SplashScreenComponentState();
}

class _SplashScreenComponentState extends ConsumerState<SplashScreenComponent> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      //final splashAuthCheck = ref.read(splashAuthProvider);

      // splashAuthCheck.whenData((isLoggedIn) {
      //   Navigator.pushReplacement(
      //     context,
      //     CustomFadeTransition(
      //       route:
      //           isLoggedIn ? HomeScreenContainer() : WelcomeScreenContainer(),
      //     ),
      //   );
      // });
      context.pushReplacement('/welcome-screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = ref.watch(themeProvider);

    return Scaffold(
      backgroundColor: color.background,
      body: Center(
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 5,
          child: Logo(height: 70, width: 70, iconSize: 50),
        ),
      ),
    );
  }
}
