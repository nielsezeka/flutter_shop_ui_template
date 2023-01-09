import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transparent_image/transparent_image.dart';

class AppThumnailImageIcon extends StatelessWidget {
  const AppThumnailImageIcon(
      {super.key, required this.imageUrl, this.isFavourite});
  final String imageUrl;
  final bool? isFavourite;
  @override
  Widget build(BuildContext context) {
    final isFavouriteItem = (isFavourite ?? false);
    return Expanded(
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(AppStyleConfiguration.itemNormalRadius),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Theme.of(context).disabledColor,
                child: Icon(
                  Iconsax.image,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Positioned.fill(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: CupertinoButton(
                onPressed: () {},
                padding: const EdgeInsets.all(0),
                child: Material(
                  color: Colors.transparent,
                  child: Icon(
                    isFavouriteItem ? Iconsax.heart5 : Iconsax.heart,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
