import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/features/settings/widgets/profile_section.dart';
import 'package:thatnightin/features/settings/widgets/settings_screen_tile.dart';

class SettingScreenComponent extends ConsumerWidget {
  const SettingScreenComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Scaffold(
      backgroundColor: color.background,

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(170),
        child: AppBar(
          backgroundColor: color.secondaryGradient2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          automaticallyImplyLeading: false,

          flexibleSpace: ProfileSection(),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          children: [
            SettingsScreenTile(
              leadingIcon: Icons.person_rounded,
              tileTitle: 'Account Settings',
            ),

            SizedBox(height: 30.0),

            SettingsScreenTile(
              leadingIcon:
                  ref.watch(themeModeProvider) == ThemeMode.dark
                      ? Icons.dark_mode_rounded
                      : Icons.wb_sunny_rounded,
              tileTitle:
                  ref.watch(themeModeProvider) == ThemeMode.dark
                      ? 'Under the lights'
                      : 'Midday',
              suffixWidget: CupertinoSwitch(
                activeTrackColor: color.secondaryGradient2,

                value: ref.watch(themeModeProvider) == ThemeMode.dark,
                onChanged: (value) {
                  ref.watch(themeModeProvider.notifier).toggleTheme();
                },
              ),
            ),

            SizedBox(height: 30.0),

            SettingsScreenTile(
              leadingIcon: Icons.power_settings_new_rounded,
              tileTitle: "Sign out",
              suffixWidget: IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  context.go('/welcome-screen');
                },
                icon: Icon(Icons.logout),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
