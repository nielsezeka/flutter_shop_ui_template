import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:flutter_shop_ui_template_for_sale/routes/routes.dart';
import 'package:iconsax/iconsax.dart';

class AppRatingBarDetailItem extends StatelessWidget {
  const AppRatingBarDetailItem({
    super.key,
    required this.ratingAverage,
    required this.totalSold,
    required this.totalReviewCount,
  });
  final double ratingAverage;
  final int totalSold;
  final int totalReviewCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            border: Border.all(
              color: Theme.of(context).primaryColor,
            ),
            borderRadius:
                BorderRadius.circular(AppStyleConfiguration.itemNormalRadius),
          ),
          height: 30,
          padding: const EdgeInsets.all(3),
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: AutoSizeText(
                '$totalSold Sold',
                maxLines: 1,
                minFontSize: 3,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: AppStyleConfiguration.paddingSpacer * 3,
          ),
        ),
        Icon(
          Iconsax.star,
          color: Theme.of(context).primaryColor,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: AppStyleConfiguration.paddingSpacer,
          ),
        ),
        Text(
          ratingAverage.toStringAsFixed(2),
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: AppStyleConfiguration.paddingSpacer,
          ),
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 10,
          onPressed: () => Navigator.of(context).pushNamed(
            ScreenRoute.reviews.name,
          ),
          child: Text(
            '($totalReviewCount reviews)',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).primaryColor,
                  decoration: TextDecoration.underline,
                  decorationColor: Theme.of(context).primaryColor,
                ),
          ),
        ),
      ],
    );
  }
}
