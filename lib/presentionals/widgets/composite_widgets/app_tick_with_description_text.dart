import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';

class AppTickWithDescriptionText extends StatefulWidget {
  const AppTickWithDescriptionText({
    super.key,
    required this.tittle,
    required this.isShowTickIcon,
    required this.onPressed,
  });
  final String tittle;
  final bool isShowTickIcon;
  final VoidCallback onPressed;
  @override
  State<AppTickWithDescriptionText> createState() =>
      _AppTickWithDescriptionTextState();
}

class _AppTickWithDescriptionTextState
    extends State<AppTickWithDescriptionText> {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => widget.onPressed(),
      minSize: 1,
      padding: EdgeInsets.zero,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTickWidget(
            isTick: widget.isShowTickIcon,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: AppStyleConfiguration.paddingSpacer,
            ),
            child: Text(
              widget.tittle,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
