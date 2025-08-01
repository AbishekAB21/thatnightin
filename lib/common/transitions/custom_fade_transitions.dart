import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// This file manages the Custom Fade Page Transition Animations

CustomTransitionPage<void> fadeTransitionPage({required Widget child}) {
  return CustomTransitionPage<void>(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween<double>(
        begin: 0,
        end: 1,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeIn));
      return FadeTransition(opacity: tween, child: child);
    },
  );
}
