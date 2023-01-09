import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:icons_plus/icons_plus.dart';

class AppRatingInfo extends StatefulWidget {
  const AppRatingInfo({super.key});

  @override
  State<AppRatingInfo> createState() => _AppRatingInfoState();
}

class _AppRatingInfoState extends State<AppRatingInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'How is your order',
          style: Theme.of(context).textTheme.headline6,
        ),
        Text('Please give your rating also review',
            style: Theme.of(context).textTheme.bodyText1),
        const AppVerticalPadding(),
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          glow: false,
          itemSize: 30,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            IonIcons.star,
            color: Theme.of(context).primaryColor,
          ),
          onRatingUpdate: (rating) {},
        ),
        const AppVerticalPadding(),
        const AppInputField(
          hintText: 'Your review',
        ),
        const AppVerticalPadding(),
      ],
    );
  }
}
