import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:iconsax/iconsax.dart';

class AppSettingTile extends StatefulWidget {
  const AppSettingTile({
    super.key,
    required this.leading,
    required this.center,
    this.trailing,
    required this.onPressed,
  });
  final Widget leading;
  final Widget center;
  final Widget? trailing;
  final VoidCallback onPressed;
  @override
  State<AppSettingTile> createState() => _AppSettingTileState();
}

class _AppSettingTileState extends State<AppSettingTile> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => widget.onPressed(),
      padding: EdgeInsets.zero,
      child: Material(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            SizedBox(
              height: AppStyleConfiguration.itemDefaultHeight,
              child: Row(
                children: [
                  widget.leading,
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppStyleConfiguration.paddingSpacer * 3),
                    child: widget.center,
                  ),
                  const Spacer(),
                  widget.trailing ??
                      Icon(Iconsax.arrow_right5,
                          color: Theme.of(context).primaryColor),
                ],
              ),
            ),
            Divider(
              color: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .color!
                  .withOpacity(0.5),
            )
          ],
        ),
      ),
    );
  }
}
