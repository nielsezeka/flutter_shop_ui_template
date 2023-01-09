import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppIconWithText extends StatelessWidget {
  const AppIconWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const AppIcon(size: 50),
        AutoSizeText(
          AppLocalizations.of(context)!.appName,
          style: Theme.of(context).textTheme.headline5?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
          maxLines: 1,
          minFontSize: 20,
          maxFontSize: 40,
        )
      ],
    );
  }
}
