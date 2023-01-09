import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:iconsax/iconsax.dart';

class AppSelectShippingMethodTile extends StatelessWidget {
  const AppSelectShippingMethodTile({
    super.key,
    required this.isPicked,
    required this.shippingName,
    required this.shippingDescription,
    required this.onPressed,
  });
  final bool isPicked;
  final String shippingName;
  final String shippingDescription;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => onPressed(),
      padding: EdgeInsets.zero,
      child: Column(
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
                  shippingName,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  shippingDescription,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            trailing: Row(
              children: [
                Text(
                  '\$ 10',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: AppStyleConfiguration.paddingSpacer),
                ),
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
                  padding: EdgeInsets.only(
                      right: AppStyleConfiguration.paddingSpacer),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
