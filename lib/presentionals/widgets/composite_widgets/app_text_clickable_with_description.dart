import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';

class AppTextClickableWithDescription extends StatelessWidget {
  const AppTextClickableWithDescription({
    super.key,
    required this.normalText,
    required this.clickableText,
    required this.onPressed,
  });
  final String normalText;
  final String clickableText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          normalText,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        const Padding(padding: EdgeInsets.only(right: 8)),
        AppTextClickable(
          tittle: clickableText,
          onPressed: () => onPressed(),
        ),
      ],
    );
  }
}
