import 'package:go_router/go_router.dart';

import 'package:thatnightin/common/transitions/custom_fade_transitions.dart';
import 'package:thatnightin/features/home/container/home_screen_container.dart';

import 'package:thatnightin/features/splash/container/splash_screen_container.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // Splash
    GoRoute(
      path: '/',
      pageBuilder:
          (context, state) =>
              fadeTransitionPage(child: const SplashScreenContainer()),
    ),

    // Home
    GoRoute(
      path: '/home-screen',
      pageBuilder:
          (context, state) =>
              fadeTransitionPage(child: const HomeScreenContainer()),
    ),
  ],
);
