import 'package:flutter/material.dart';

import 'package:thatnightin/features/details/component/match_details_screen_component.dart';

class MatchDetailsScreenContainer extends StatelessWidget {
  final String matchId;
  const MatchDetailsScreenContainer({super.key, required this.matchId});

  @override
  Widget build(BuildContext context) {
    return MatchDetailsScreenComponent(matchId: matchId,);
  }
}