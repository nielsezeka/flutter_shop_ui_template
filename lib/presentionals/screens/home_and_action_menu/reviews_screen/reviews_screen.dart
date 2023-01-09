import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';

import 'review_screen_bloc.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final ReviewScreenBloc _reviewScreenBloc = ReviewScreenBloc();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: AppHorizontalPaddingChild(
          child: Column(
            children: [
              StreamBuilder<String>(
                  stream: _reviewScreenBloc.observerReview(),
                  builder: (context, snapshot) {
                    final textInNavigationBar = snapshot.data ?? '';
                    return AppNavigationBar(
                      tittle: textInNavigationBar,
                    );
                  }),
              AppBubbleSelection(
                selectedIndex: 0,
                items: const [
                  'All',
                  '5 Stars',
                  '4 Stars',
                  '3 Stars',
                  '2 Stars',
                  '1 Star'
                ],
                onClicked: (index) {},
              ),
              const AppVerticalPadding(),
              Expanded(
                child: StreamBuilder<List<AppUserReviewItemUIModel>>(
                  stream: _reviewScreenBloc.observerReviews(),
                  builder: (context, snapshot) {
                    List<AppUserReviewItemUIModel> reviews =
                        snapshot.data ?? [];
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              AppUserReviewItem(
                                  appUserReviewItemUIModel: reviews[index]),
                              const AppVerticalPadding(
                                multiplier: 2,
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: reviews.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
