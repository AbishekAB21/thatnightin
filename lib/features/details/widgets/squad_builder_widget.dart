import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/utils/fontstyles/fontstyles.dart';

class SquadBuilderWidget extends ConsumerWidget {
  const SquadBuilderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Starting XI', style: Fontstyles.roboto22px(context, ref)),
        SizedBox(height: 10.0),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder:
              (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: color.secondaryGradient2,
                  child: Icon(Icons.person_rounded),
                ),
                title: Text(
                  'Player Name',
                  style: Fontstyles.roboto16pxSemiBold(context, ref),
                ),
                subtitle: Text(
                  'Nationality',
                  style: Fontstyles.roboto13px(context, ref),
                ),
                dense: true,
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: 11,
        ),
        Text('Substitutes', style: Fontstyles.roboto22px(context, ref)),
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder:
              (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundColor: color.secondaryGradient1,
                  child: Icon(Icons.person_rounded),
                ),
                title: Text(
                  'Player Name',
                  style: Fontstyles.roboto16pxSemiBold(context, ref),
                ),
                subtitle: Text(
                  'Nationality',
                  style: Fontstyles.roboto13px(context, ref),
                ),
                dense: true,
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: 5,
        ),
      ],
    );
  }
}
