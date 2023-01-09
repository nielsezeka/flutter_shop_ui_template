import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import '../../presentionals_index.dart';

class AppQuantityManageWithText extends StatelessWidget {
  const AppQuantityManageWithText({
    super.key,
    required this.quantity,
    required this.onChangedNumber,
    required this.itemID,
  });
  final int quantity;
  final String itemID;
  final ValueChanged<int> onChangedNumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Quantity',
          style: Theme.of(context).textTheme.headline6,
        ),
        Padding(
          padding: EdgeInsets.all(AppStyleConfiguration.paddingSpacer),
        ),
        AppQuantityManage(
          quantity: quantity,
          itemID: itemID,
          autoAddToCart: false,
        ),
      ],
    );
  }
}
