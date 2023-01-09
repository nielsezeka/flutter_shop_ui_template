import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:iconsax/iconsax.dart';

class AppAddingProductBar extends StatefulWidget {
  const AppAddingProductBar({
    super.key,
    required this.buttonTittle,
    required this.onClick,
    required this.totalCount,
  });
  final String buttonTittle;
  final VoidCallback onClick;
  final int totalCount;
  @override
  State<AppAddingProductBar> createState() => _AppAddingProductBarState();
}

class _AppAddingProductBarState extends State<AppAddingProductBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppStyleConfiguration.itemDefaultHeight * 2,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Price',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  '${widget.totalCount}\$',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: AppButton(
              tittle: widget.buttonTittle,
              leadingIcon: const Icon(
                Iconsax.buy_crypto,
                color: Colors.white,
              ),
              onPresssed: () => widget.onClick(),
            ),
          ),
        ],
      ),
    );
  }
}
