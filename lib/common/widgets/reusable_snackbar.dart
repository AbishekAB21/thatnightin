import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';

class ShowCustomSnackbar {
  showSnackbar(
    BuildContext context,
    String message,
    Color backgroundColor,
    WidgetRef ref,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: Fontstyles.roboto15px(context, ref)),
        backgroundColor: backgroundColor.withValues(alpha: 0.95),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }


}
