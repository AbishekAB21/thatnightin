import 'package:flutter/material.dart';

import 'package:thatnightin/features/details/component/highlights_details_component.dart';

class DiscussionContainer extends StatelessWidget {
  final String matchId;
  const DiscussionContainer({super.key, required this.matchId});

  @override
  Widget build(BuildContext context) {
    return DiscussionComponent(matchId: matchId);
  }
}
