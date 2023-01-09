import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';

import 'package:flutter_svg/flutter_svg.dart';

class AppSocialButtons extends StatelessWidget {
  AppSocialButtons({super.key});
  final supportedPlatform = [
    'assets/svg/apple.svg',
    'assets/svg/facebook.svg',
    'assets/svg/google.svg',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: supportedPlatform
            .map(
              (e) => _renderButton(
                e,
                Theme.of(context),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _renderButton(String icon, ThemeData theme) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        width: 80,
        decoration: BoxDecoration(
          border: Border.all(
            color: theme.disabledColor,
          ),
          borderRadius:
              BorderRadius.circular(AppStyleConfiguration.itemNormalRadius),
        ),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: SvgPicture.asset(icon),
            ),
          ),
        ),
      ),
      onPressed: () {},
    );
  }
}
