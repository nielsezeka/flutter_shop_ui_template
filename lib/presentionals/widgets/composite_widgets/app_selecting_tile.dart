import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:iconsax/iconsax.dart';

class AppSelectingTile extends StatefulWidget {
  const AppSelectingTile(
      {super.key, required this.tittle, required this.leadingIcon});
  final String tittle;
  final Widget leadingIcon;
  @override
  State<AppSelectingTile> createState() => _AppSelectingTileState();
}

class _AppSelectingTileState extends State<AppSelectingTile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
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
        child: AppThreePartsButtons(
          leading: widget.leadingIcon,
          center: Text(
            widget.tittle,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          trailing: Icon(
            Iconsax.arrow_right_2,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
