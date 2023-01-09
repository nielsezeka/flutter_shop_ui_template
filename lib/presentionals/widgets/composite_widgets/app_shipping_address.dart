import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:iconsax/iconsax.dart';

class AppShippingAdress extends StatefulWidget {
  const AppShippingAdress({super.key, required this.userAddressAsString});
  final String userAddressAsString;
  @override
  State<AppShippingAdress> createState() => _AppShippingAdressState();
}

class _AppShippingAdressState extends State<AppShippingAdress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppStyleConfiguration.itemDefaultHeight,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: AppThreePartsButtons(
        leading: const Icon(Iconsax.location),
        center: Text(
          widget.userAddressAsString,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        trailing: Icon(
          Iconsax.pen_add,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
