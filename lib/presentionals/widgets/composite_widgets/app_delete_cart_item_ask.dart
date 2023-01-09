import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';

class AppDeleteCartItemAsk extends StatelessWidget {
  const AppDeleteCartItemAsk(
      {super.key, required this.uiInfo, required this.onConfirmedDelete});
  final CartItemUIModel uiInfo;
  final VoidCallback onConfirmedDelete;
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppVerticalPadding(),
              Text(
                'Remove from cart?',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: AppCartItem(
                  onDelete: (value) {},
                  uiInfo: uiInfo,
                  enableDeleteButton: false,
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
                      tittle: 'OK',
                      onPresssed: () {
                        onConfirmedDelete();
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
    );
  }
}
