import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';

class AppTickWidget extends StatelessWidget {
  AppTickWidget({super.key, this.size, this.isTick});
  final double? size;
  final bool? isTick;
  final tickDefaultSize = AppStyleConfiguration.itemDefaultTick;

  @override
  Widget build(BuildContext context) {
    final tickSize = size ?? tickDefaultSize;
    return Container(
      width: tickSize,
      height: tickSize,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 2.5,
        ),
        borderRadius: BorderRadius.circular(
          AppStyleConfiguration.itemNormalRadius,
        ),
      ),
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: (isTick ?? false)
                ? Theme.of(context).primaryColor
                : Theme.of(context).disabledColor,
          ),
        ),
      ),
    );
  }
}
