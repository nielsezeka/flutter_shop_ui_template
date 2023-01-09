import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';

class AppThreePartsButtons extends StatelessWidget {
  const AppThreePartsButtons({
    super.key,
    required this.leading,
    required this.center,
    required this.trailing,
    this.isUsedShadow,
    this.multiplier,
  });
  final Widget leading;
  final Widget center;
  final Widget trailing;
  final bool? isUsedShadow;
  final int? multiplier;
  @override
  Widget build(BuildContext context) {
    final needShadow = isUsedShadow ?? false;
    final newMultiplier = multiplier ?? 1;
    return AppHorizontalPaddingChild(
      child: Container(
        decoration: needShadow
            ? BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 1), // changes position of shadow
                    ),
                  ])
            : null,
        height: AppStyleConfiguration.itemDefaultHeight * newMultiplier,
        child: Row(
          children: [
            leading,
            Padding(
                padding: EdgeInsets.all(AppStyleConfiguration.paddingSpacer)),
            Expanded(
              child: center,
            ),
            Padding(
                padding: EdgeInsets.all(AppStyleConfiguration.paddingSpacer)),
            trailing,
          ],
        ),
      ),
    );
  }
}
