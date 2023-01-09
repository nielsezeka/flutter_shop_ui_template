import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:iconsax/iconsax.dart';

class AppEmptyData extends StatelessWidget {
  const AppEmptyData({
    super.key,
    required this.tittle,
    required this.description1,
    required this.description2,
  });
  final String tittle;
  final String description1;
  final String description2;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Iconsax.note4,
          size: 150,
        ),
        Text(
          tittle,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const AppVerticalPadding(),
        Text(
          description1,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          description2,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
