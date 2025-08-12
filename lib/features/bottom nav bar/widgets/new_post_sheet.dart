import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/common/widgets/reusable_textfield.dart';
import 'package:thatnightin/common/widgets/reusable_textfield_without_prefix_suffix.dart';
import 'package:thatnightin/features/search/widgets/search_result_widget.dart';
import 'package:thatnightin/utils/fontstyles/fontstyles.dart';

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
                            onPressed: () {},
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
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Pick the match',
                                  style: Fontstyles.roboto17Bold(context, ref),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              ReusableTextfield(
                                hintText: 'Pick the match',
                                controller: searchController,
                              ),
                              SizedBox(height: 10.0),
                              SearchResultWidget(),
                              SizedBox(height: 20.0),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Add a caption',
                                  style: Fontstyles.roboto17Bold(context, ref),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              ReusableTextfieldWithoutPrefixSuffix(
                                hintText: 'Add a caption',
                                controller: captionController,
                                maxlines: 3,
                              ),
                              SizedBox(height: 20.0),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Add an image',
                                  style: Fontstyles.roboto17Bold(context, ref),
                                ),
                              ),
                              SizedBox(height: 10.0),
                        
                              // Adjust the bottom container to display the selected image once selected
                              Container(
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(
                                    color: color.textfieldBackground2,
                                  ),
                                ),
                                child: Center(
                                  child: IconButton.outlined(
                                    style: ButtonStyle(
                                      shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10.0,
                                          ),
                                          side: BorderSide(
                                            color: color.textfieldBackground,
                                          ),
                                        ),
                                      ),
                                    ),
                        
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.image_rounded,
                                      color: color.secondaryGradient2,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
