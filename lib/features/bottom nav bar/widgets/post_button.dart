import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/widgets/top_snackbar.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/common/providers/loading_state_provider.dart';
import 'package:thatnightin/features/home/core/providers/home_provider.dart';
import 'package:thatnightin/features/home/core/providers/home_search_state_provider.dart';

class PostButton extends ConsumerWidget {
  final TextEditingController captionController;
  final TextEditingController searchController;
  const PostButton({
    super.key,
    required this.captionController,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeProvider);
    return TextButton(
      onPressed: () async {
        ref.read(loadingProvider.notifier).state = true;
        final selectedMatch = ref.read(selectedMatchProvider);
        final caption = captionController.text.trim();
        final matchId = selectedMatch!["fixture"]["id"].toString();
        final uid = FirebaseAuth.instance.currentUser!.uid;

        // Fetch match stats
        final stats = await ref
            .read(homeServiceProvider)
            .getMatchStats(selectedMatch["fixture"]["id"]);

        // Merge stats with selectedMatch
        final enrichedMatch = {...selectedMatch, "stats": stats};

        // Saving Match data
        await ref.read(homeDBProvider).saveMatchDetails(matchId, enrichedMatch);

        // Fetching Image
        final pickedImage = ref.watch(pickedImageProvider);

        // Fetching Image url
        final pickedImageUrl = await ref
            .read(homeDBProvider)
            .uploadImageToStorage(pickedImage!);

        if (pickedImageUrl == null && context.mounted) {
          TopSnackbar().showTopSnackbar(
            "Error uploading image",
            context,
            color.errorColor,
            Fontstyles.roboto13px(context, ref),
          );
        }

        // Saving post data and creating post
        await ref
            .read(homeDBProvider)
            .savePostToDatabase(
              matchId: matchId,
              caption: caption,
              uid: uid,
              imageUrl: pickedImageUrl,
            );

        captionController.clear();
        searchController.clear();
        ref.invalidate(selectedMatchProvider);

        ref.read(loadingProvider.notifier).state = false;

        if (context.mounted) {
          context.pop();

          Future.microtask(() {
            if (context.mounted) {
              TopSnackbar().showTopSnackbar(
                'Posted Successfully',
                context,
                color.successColor,
                Fontstyles.roboto13px(context, ref),
              );
            }
          });
        }
      },
      child: Text(
        'Post',
        style: Fontstyles.roboto16pxSemiBoldBlue(context, ref),
      ),
    );
  }
}
