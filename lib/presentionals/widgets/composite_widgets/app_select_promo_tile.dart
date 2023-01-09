import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:iconsax/iconsax.dart';

class AppSelectPromoTile extends StatelessWidget {
  const AppSelectPromoTile({
    super.key,
    required this.isPicked,
    required this.name,
    required this.description,
  });
  final bool isPicked;
  final String name;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppThreePartsButtons(
          isUsedShadow: true,
          multiplier: 2,
          leading: AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              height: double.infinity,
              margin: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Icon(
                  Iconsax.card,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
            ),
          ),
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                description,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          trailing: Row(
            children: [
              isPicked
                  ? Icon(
                      Iconsax.tick_circle4,
                      color: Theme.of(context).primaryColor,
                    )
                  : Icon(
                      Iconsax.tick_circle4,
                      color: Theme.of(context).disabledColor,
                    ),
              Padding(
                padding:
                    EdgeInsets.only(right: AppStyleConfiguration.paddingSpacer),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
