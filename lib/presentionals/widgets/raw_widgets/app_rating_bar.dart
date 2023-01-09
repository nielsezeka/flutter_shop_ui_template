import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:iconsax/iconsax.dart';

class AppRatingBar extends StatelessWidget {
  const AppRatingBar({
    super.key,
    required this.ratingAverage,
    required this.totalSold,
  });
  final double ratingAverage;
  final int totalSold;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Iconsax.star,
          color: Theme.of(context).primaryColor,
        ),
        Padding(
          padding: EdgeInsets.only(left: AppStyleConfiguration.paddingSpacer),
        ),
        Text(
          ratingAverage.toStringAsFixed(2),
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Padding(
          padding: EdgeInsets.only(left: AppStyleConfiguration.paddingSpacer),
        ),
        Text(
          '|',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Padding(
          padding: EdgeInsets.only(left: AppStyleConfiguration.paddingSpacer),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
            ),
            borderRadius:
                BorderRadius.circular(AppStyleConfiguration.itemNormalRadius),
          ),
          width: 50,
          height: 20,
          padding: const EdgeInsets.all(3),
          child: Center(
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
      ],
    );
  }
}
