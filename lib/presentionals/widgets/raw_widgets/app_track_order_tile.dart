import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';

class AppTrackOrderTile extends StatelessWidget {
  const AppTrackOrderTile({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.bodyText1;
    return SizedBox(
      height: AppStyleConfiguration.itemDefaultHeight,
      child: AppThreePartsButtons(
        leading: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: Container(
            margin: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              color: Colors.white38,
              shape: BoxShape.circle,
            ),
          ),
        ),
        center: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order in Transit - 12 Dec',
              style: textTheme,
            ),
            Text(
              '14 Great Manchester',
              style: textTheme!.copyWith(
                color: textTheme.color!.withOpacity(
                  0.6,
                ),
              ),
            ),
          ],
        ),
        trailing: Container(
          child: Text(
            '12:12 AM',
            style: textTheme,
          ),
        ),
      ),
    );
  }
}
