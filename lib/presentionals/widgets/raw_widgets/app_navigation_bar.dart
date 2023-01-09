import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:iconsax/iconsax.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    super.key,
    required this.tittle,
    this.useIconInsteadBackButton,
  });
  final String tittle;
  final bool? useIconInsteadBackButton;
  @override
  Widget build(BuildContext context) {
    final useIconApp = useIconInsteadBackButton ?? false;
    return SizedBox(
      height: AppStyleConfiguration.itemDefaultHeight,
      child: Row(
        children: [
          useIconApp ? _renderAppIcon() : _renderBackButton(context),
          Padding(
            padding: EdgeInsets.only(left: AppStyleConfiguration.paddingSpacer),
          ),
          Text(
            tittle,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _renderAppIcon() {
    return const Padding(
      padding: EdgeInsets.only(left: 20),
      child: AppIcon(size: 30),
    );
  }

  Widget _renderBackButton(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Material(
        color: Colors.transparent,
        child: Icon(
          Iconsax.arrow_left4,
          color: Theme.of(context).textTheme.headline6!.color,
        ),
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}
