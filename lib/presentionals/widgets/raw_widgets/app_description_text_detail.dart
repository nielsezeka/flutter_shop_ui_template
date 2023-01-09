import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';

class AppDescriptionTextDetail extends StatelessWidget {
  const AppDescriptionTextDetail({super.key, required this.description});
  final String description;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            'Description',
            style: Theme.of(context).textTheme.headline6,
          ),
          const AppVerticalPadding(),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
