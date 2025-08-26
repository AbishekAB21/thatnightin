import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thatnightin/common/widgets/top_snackbar.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/features/home/core/providers/home_provider.dart';
import 'package:thatnightin/features/bottom%20nav%20bar/widgets/input_section.dart';
import 'package:thatnightin/features/home/core/providers/home_search_state_provider.dart';

class NewPostWidget {
  void showPostBottomSheet(
    BuildContext context,
    WidgetRef ref,
    TextEditingController searchController,
    TextEditingController captionController,
  ) {
    final color = ref.watch(themeProvider);
    showModalBottomSheet(
      backgroundColor: color.textfieldBackground,
      isScrollControlled: true,

      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.7,
            maxChildSize: 0.9,
            minChildSize: 0.4,
            builder: (context, scrollController) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: color.textfieldBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: Text(
                              'Cancel',
                              style: Fontstyles.roboto16pxSemiBoldBlue(
                                context,
                                ref,
                              ),
                            ),
                          ),
                          Text(
                            'New Post',
                            style: Fontstyles.roboto18px(context, ref),
                          ),
                          TextButton(
                            onPressed: () async {
                              final selectedMatch = ref.read(
                                selectedMatchProvider,
                              );
                              final caption = captionController.text.trim();
                              final matchId =
                                  selectedMatch!["fixture"]["id"].toString();
                              final uid =
                                  FirebaseAuth.instance.currentUser!.uid;

                              // Fetch match stats
                              final stats = await ref
                                  .read(homeServiceProvider)
                                  .getMatchStats(
                                    selectedMatch["fixture"]["id"],
                                  );
                              
                              // Merge stats with selectedMatch
                              final enrichedMatch = {
                                ...selectedMatch,
                                "stats" : stats,
                              };

                              // Saving Match data
                              await ref
                                  .read(homeDBProvider)
                                  .saveMatchDetails(matchId, enrichedMatch);

                              // Saving post data and creating post
                              await ref
                                  .read(homeDBProvider)
                                  .savePostToDatabase(
                                    matchId: matchId,
                                    caption: caption,
                                    uid: uid,
                                    imageUrl: null,
                                  );

                              if (context.mounted) {
                                context.pop();

                                TopSnackbar().showTopSnackbar(
                                  'Posted Successfully',
                                  context,
                                  color.successColor,
                                  Fontstyles.roboto13px(context, ref),
                                );
                              }
                            },
                            child: Text(
                              'Post',
                              style: Fontstyles.roboto16pxSemiBoldBlue(
                                context,
                                ref,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      InputSection(
                        captionController: captionController,
                        searchController: searchController,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
