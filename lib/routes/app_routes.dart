import 'package:go_router/go_router.dart';

import 'package:thatnightin/common/transitions/custom_fade_transitions.dart';
import 'package:thatnightin/features/home/container/home_screen_container.dart';
import 'package:thatnightin/features/splash/container/splash_screen_container.dart';
import 'package:thatnightin/features/search/container/search_screen_container.dart';
import 'package:thatnightin/features/my_matches/container/my_matches_container.dart';
import 'package:thatnightin/features/auth/sign%20in/containers/signin_container.dart';
import 'package:thatnightin/features/profile/container/profile_screen_container.dart';
import 'package:thatnightin/features/auth/sign%20up/containers/signup_container.dart';
import 'package:thatnightin/features/settings/container/setting_screen_container.dart';
import 'package:thatnightin/features/details/container/match_details_screen_container.dart';
import 'package:thatnightin/features/welcome_screen/container/welcome_screen_container.dart';
import 'package:thatnightin/features/bottom%20nav%20bar/containers/main_shell_container.dart';

/// Handles routing throughout the app

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // Splash screen route
    GoRoute(
      path: '/match-detail-screen',
      pageBuilder:
          (context, state) =>
              fadeTransitionPage(child: const SplashScreenContainer()),
    ),

    // Welcome screen route
    GoRoute(
      path: '/welcome-screen',
      pageBuilder:
          (context, state) =>
              fadeTransitionPage(child: const WelcomeScreenContainer()),
    ),

    // Sign In screen route
    GoRoute(
      path: '/signin-screen',
      pageBuilder:
          (context, state) =>
              fadeTransitionPage(child: const SigninContainer()),
    ),

        // Sign In screen route
    GoRoute(
      path: '/signup-screen',
      pageBuilder:
          (context, state) =>
              fadeTransitionPage(child: const SignUpContainer()),
    ),

    // Match detail screen
    GoRoute(
      path: '/match-detail-screen',
      pageBuilder:
          (context, state) =>
              fadeTransitionPage(child: const MatchDetailsScreenContainer()),
    ),

    // Settings screen
    GoRoute(
      path: '/settings-screen',
      pageBuilder:
          (context, state) =>
              fadeTransitionPage(child: const SettingScreenContainer()),
    ),

    /// Shell Route with Bottom Navigation
    ShellRoute(
      builder: (context, state, child) {
        return MainShellContainer(child: child);
      },
      routes: [
        GoRoute(
          path: '/home-screen',
          pageBuilder:
              (context, state) =>
                  fadeTransitionPage(child: const HomeScreenContainer()),
        ),
        GoRoute(
          path: '/mymatches-screen',
          pageBuilder:
              (context, state) =>
                  fadeTransitionPage(child: const MyMatchesContainer()),
        ),
        GoRoute(
          path: '/search-screen',
          pageBuilder:
              (context, state) =>
                  fadeTransitionPage(child: const SearchScreenContainer()),
        ),
        GoRoute(
          path: '/profile-screen',
          pageBuilder:
              (context, state) =>
                  fadeTransitionPage(child: const ProfileScreenContainer()),
        ),
      ],
    ),
  ],
);
