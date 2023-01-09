import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';

class AppReviewAsk extends StatelessWidget {
  const AppReviewAsk({
    super.key,
    required this.uiInfo,
    required this.onConfirmed,
  });
  final OrderItemUIModel uiInfo;
  final VoidCallback onConfirmed;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(AppStyleConfiguration.itemNormalRadius),
        topRight: Radius.circular(AppStyleConfiguration.itemNormalRadius),
      ),
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AppHorizontalPaddingChild(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AppVerticalPadding(),
                  Text(
                    'Leave a Review',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const AppVerticalPadding(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppStyleConfiguration.paddingSpacer),
                    child: Divider(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                  const AppVerticalPadding(),
                  AppOrderTile(uiInfo: uiInfo, tileType: OrderTileType.review),
                  const AppVerticalPadding(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppStyleConfiguration.paddingSpacer),
                    child: Divider(
                      color: Theme.of(context).textTheme.bodyText1!.color,
                    ),
                  ),
                  const AppVerticalPadding(),
                  const AppRatingInfo(),
                  const AppVerticalPadding(),
                  Row(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.all(AppStyleConfiguration.paddingSpacer),
                      ),
                      Expanded(
                        child: AppButton(
                          tittle: 'Cancel',
                          onPresssed: () => Navigator.of(context).pop(),
                          buttonStyle: AppButtonStyle.primariColorBorderOnly,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.all(AppStyleConfiguration.paddingSpacer),
                      ),
                      Expanded(
                        child: AppButton(
                          tittle: 'Submit',
                          onPresssed: () {
                            onConfirmed();
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.all(AppStyleConfiguration.paddingSpacer),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
