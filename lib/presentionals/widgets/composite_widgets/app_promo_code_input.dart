import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:flutter_shop_ui_template_for_sale/routes/routes.dart';
import 'package:iconsax/iconsax.dart';

class AppPromoCodeInput extends StatefulWidget {
  const AppPromoCodeInput({
    super.key,
    required this.selectedPromoCodeAsString,
    required this.onDeletePromo,
  });
  final String selectedPromoCodeAsString;
  final VoidCallback onDeletePromo;
  @override
  State<AppPromoCodeInput> createState() => _AppPromoCodeInputState();
}

class _AppPromoCodeInputState extends State<AppPromoCodeInput> {
  @override
  Widget build(BuildContext context) {
    return AppThreePartsButtons(
      leading: Container(),
      center: Stack(
        children: [
          const AppInputField(
            hintText: 'Enter Promo Code',
          ),
          widget.selectedPromoCodeAsString.isEmpty
              ? Container()
              : _renderSelectedPromo(),
        ],
      ),
      trailing: CupertinoButton(
        onPressed: () =>
            Navigator.of(context).pushNamed(ScreenRoute.shippingPromoPick.name),
        padding: EdgeInsets.zero,
        child: Material(
          color: Colors.transparent,
          child: Icon(
            Iconsax.element_plus,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _renderSelectedPromo() {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius:
              BorderRadius.circular(AppStyleConfiguration.itemNormalRadius),
          border: Border.all(color: Theme.of(context).primaryColor)),
      child: Center(
        child: Row(
          children: [
            Padding(
                padding:
                    EdgeInsets.only(left: AppStyleConfiguration.paddingSpacer)),
            Text(
              widget.selectedPromoCodeAsString,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: Container(
                  width: 44,
                  decoration: BoxDecoration(
                      color: Theme.of(context).errorColor,
                      shape: BoxShape.circle),
                  child: const Center(
                    child: Text('-'),
                  ),
                ),
                onPressed: () => widget.onDeletePromo(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
