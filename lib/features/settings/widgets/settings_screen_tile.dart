import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/utils/fontstyles/fontstyles.dart';

class SettingsScreenTile extends ConsumerWidget {
  final IconData leadingIcon;
  final String tileTitle;
  final Widget? suffixWidget;
  const SettingsScreenTile({
    super.key,
    required this.leadingIcon,
    required this.tileTitle,
    this.suffixWidget,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: color.secondaryGradient2,
              child: Icon(leadingIcon, size: 30, color: color.plainWhite),
            ),
            SizedBox(width: 10.0),
            Text(tileTitle, style: Fontstyles.roboto20px(context, ref)),
          ],
        ),

        suffixWidget ??
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward_ios_rounded),
            ),
      ],
    );
  }
}
