import 'package:flutter/material.dart';

import 'package:thatnightin/features/details/component/stats_tab_component.dart';

class StatsTabContainer extends StatelessWidget {
  final String matchId;
  const StatsTabContainer({super.key, required this.matchId});

  @override
  Widget build(BuildContext context) {
    return StatsTabComponent(macthId: matchId);
  }
}
