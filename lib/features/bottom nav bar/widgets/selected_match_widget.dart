import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/utils/fontstyles/fontstyles.dart';
import 'package:thatnightin/common/providers/theme_provider.dart';
import 'package:thatnightin/features/bottom%20nav%20bar/widgets/search_result_widget.dart';

class SelectedMatchWidget extends ConsumerWidget {
  final Map<String, dynamic> match;
  const SelectedMatchWidget({super.key, required this.match});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeTeam = match["homeTeam"];
    final awayTeam = match["awayTeam"];
    final date = match["date"];
    final color = ref.watch(themeProvider);
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Selected match',
            style: Fontstyles.roboto17Bold(context, ref),
          ),
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: color.textfieldBackground2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SearchResultWidget(
                  homeTeam: "$homeTeam",
                  awayTeam: "$awayTeam",
                  date: "$date",
                ),
              ),

              Positioned(
                right: 4,
                bottom: 4,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(8.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.0),
                        topLeft: Radius.circular(5.0),
                        bottomRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(5.0),
                      ),
                      color: color.errorColor.withValues(alpha: 0.55),
                    ),
                    child: Icon(Icons.close, size: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
