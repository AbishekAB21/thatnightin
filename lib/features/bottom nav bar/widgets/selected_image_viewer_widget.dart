import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/features/home/core/providers/home_provider.dart';

class SelectedImageViewerWidget extends ConsumerWidget {
  final XFile? pickedImage;
  const SelectedImageViewerWidget({super.key, required this.pickedImage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20),
          height: 350,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: color.defaultOverlayColor,
            image: DecorationImage(
              image: FileImage(File(pickedImage!.path)),
              fit: BoxFit.cover,
              opacity: 0.60,
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
            onPressed: () {
              ref.invalidate(pickedImageProvider);
            },
            icon: Icon(Icons.delete, color: color.iconColor),
          ),
        ),
      ],
    );
  }
}
