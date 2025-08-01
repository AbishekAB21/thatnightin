import 'package:go_router/go_router.dart';

import 'package:thatnightin/common/transitions/custom_fade_transitions.dart';
import 'package:thatnightin/features/home/container/home_screen_container.dart';
import 'package:thatnightin/features/settings/container/setting_screen_container.dart';
import 'package:thatnightin/features/splash/container/splash_screen_container.dart';
import 'package:thatnightin/features/my_matches/container/my_matches_container.dart';
import 'package:thatnightin/features/profile/container/profile_screen_container.dart';
import 'package:thatnightin/features/search/container/search_screen_container.dart';
import 'package:thatnightin/features/bottom%20nav%20bar/containers/main_shell_container.dart';
import 'package:thatnightin/features/details/container/match_details_screen_container.dart';

/// Handles routing throughout the app

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // Splash screen route
    GoRoute(
      path: '/',
      pageBuilder:
          (context, state) =>
              fadeTransitionPage(child: const SplashScreenContainer()),
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
