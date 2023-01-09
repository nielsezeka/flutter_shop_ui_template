import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:iconsax/iconsax.dart';

class ProductNameWithFavouriteIcon extends StatelessWidget {
  const ProductNameWithFavouriteIcon({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppStyleConfiguration.itemDefaultHeight,
      child: Row(children: [
        Text(
          name,
          style: Theme.of(context).textTheme.headline4,
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Iconsax.heart,
            size: 25,
          ),
        )
      ]),
    );
  }
}
