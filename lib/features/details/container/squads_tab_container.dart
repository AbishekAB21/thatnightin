import 'package:flutter/material.dart';

import 'package:thatnightin/features/details/component/squads_tab_component.dart';

class SquadsTabContainer extends StatelessWidget {
  final String matchId;
  const SquadsTabContainer({super.key, required this.matchId});

  @override
  Widget build(BuildContext context) {
    return SquadsTabComponent(matchId: matchId);
  }
}
