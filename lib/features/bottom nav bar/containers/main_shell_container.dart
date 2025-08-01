import 'package:flutter/material.dart';

import 'package:thatnightin/features/bottom%20nav%20bar/components/main_shell_component.dart';

class MainShellContainer extends StatelessWidget {
  final Widget child;
  const MainShellContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MainShellComponent(child: child,);
  }
}
