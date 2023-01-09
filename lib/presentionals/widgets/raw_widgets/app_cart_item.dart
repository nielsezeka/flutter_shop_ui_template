import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:flutter_shop_ui_template_for_sale/services/server_data_provider/server_data_provider.dart';
import 'package:flutter_shop_ui_template_for_sale/theme/custom_theme.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transparent_image/transparent_image.dart';

class CartItemUIModel {
  final String imageUrl;
  final int price;
  final int totalItem;
  final String name;
  final String cartItemId;

  CartItemUIModel({
    required this.imageUrl,
    required this.price,
    required this.cartItemId,
    required this.name,
    required this.totalItem,
  });
  CartItemUIModel.from(ProductModeFromBackend product, int numberOfItem)
      : imageUrl = product.imageURL,
        price = product.price,
        cartItemId = product.productID,
        name = product.name,
        totalItem = numberOfItem;
  CartItemUIModel.fromOrder(OrderItemUIModel order)
      : imageUrl = order.imageUrl,
        price = order.price,
        cartItemId = order.cartItemId,
        name = order.name,
        totalItem = order.quantity;
}

class AppCartItem extends StatefulWidget {
  const AppCartItem({
    super.key,
    required this.onDelete,
    required this.uiInfo,
    this.enableDeleteButton,
    this.enablePlusAndMinusButtons,
  });
  final ValueChanged<String> onDelete;
  final CartItemUIModel uiInfo;
  final bool? enableDeleteButton;
  final bool? enablePlusAndMinusButtons;
  @override
  State<AppCartItem> createState() => _AppCartItemState();
}

class _AppCartItemState extends State<AppCartItem> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: CustomTheme.animationDuration,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      height: AppStyleConfiguration.itemDefaultHeight * 2.5,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: widget.uiInfo.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.uiInfo.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    '\$ ${widget.uiInfo.price}',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppQuantityManage(
                        enablePlusAndMinusButtons:
                            widget.enablePlusAndMinusButtons ?? true,
                        quantity: widget.uiInfo.totalItem,
                        itemID: widget.uiInfo.cartItemId,
                        autoAddToCart: true,
                      ),
                      const Spacer(),
                      (widget.enableDeleteButton ?? true)
                          ? CupertinoButton(
                              minSize: 1,
                              padding: const EdgeInsets.all(0),
                              onPressed: () => showModalBottomSheet<void>(
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (BuildContext context) {
                                  return AppDeleteCartItemAsk(
                                    uiInfo: widget.uiInfo,
                                    onConfirmedDelete: () => widget.onDelete(
                                      widget.uiInfo.cartItemId,
                                    ),
                                  );
                                },
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: Icon(
                                  Iconsax.trash,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color,
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
