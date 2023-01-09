import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:iconsax/iconsax.dart';

class AppSelectAddressTile extends StatelessWidget {
  const AppSelectAddressTile({
    super.key,
    required this.isPicked,
    required this.topTitle,
    required this.bottomDescription,
    this.enableEdittingBar,
    this.onClickEdit,
    this.onClickDelete,
  });
  final bool isPicked;
  final bool? enableEdittingBar;
  final String topTitle;
  final String bottomDescription;
  final VoidCallback? onClickEdit;
  final VoidCallback? onClickDelete;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppThreePartsButtons(
          isUsedShadow: true,
          multiplier: 2,
          leading: AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              height: double.infinity,
              margin: const EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Icon(
                  Iconsax.card,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
            ),
          ),
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                topTitle,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                bottomDescription,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          trailing: _renderTrailingBar(context),
        ),
      ],
    );
  }

  Widget _renderTrailingBar(BuildContext context) {
    final isUseEditting = enableEdittingBar ?? false;
    if (isUseEditting) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              if (onClickEdit != null) {
                onClickEdit!();
              }
            },
            child: Icon(
              Iconsax.edit,
              color: Theme.of(context).primaryColor,
            ),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              if (onClickDelete != null) {
                onClickDelete!();
              }
            },
            child: Icon(
              BoxIcons.bx_trash_alt,
              color: Theme.of(context).errorColor,
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          isPicked
              ? Icon(
                  Iconsax.tick_circle4,
                  color: Theme.of(context).primaryColor,
                )
              : Icon(
                  Iconsax.tick_circle4,
                  color: Theme.of(context).disabledColor,
                ),
          Padding(
            padding:
                EdgeInsets.only(right: AppStyleConfiguration.paddingSpacer),
          ),
        ],
      );
    }
  }
}
