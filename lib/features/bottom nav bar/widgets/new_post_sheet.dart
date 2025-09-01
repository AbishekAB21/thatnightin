import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/common/providers/loading_state_provider.dart';
import 'package:thatnightin/features/bottom%20nav%20bar/widgets/post_button.dart';
import 'package:thatnightin/features/bottom%20nav%20bar/widgets/input_section.dart';

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
        return Consumer(
          builder: (context, ref, child) {
            final isloading = ref.watch(loadingProvider);

            return isloading
                ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: color.secondaryGradient2,
                    ),
                  ),
                )
                : GestureDetector(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                  PostButton(
                                    captionController: captionController,
                                    searchController: searchController,
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
      },
    );
  }
}
