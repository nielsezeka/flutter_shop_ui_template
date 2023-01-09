import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:iconsax/iconsax.dart';

enum NotificationUIModelType { card, discount }

class NotificationUIModel {
  final String tittle;
  final String dateAsString;
  final String description;
  final NotificationUIModelType type;

  NotificationUIModel({
    required this.tittle,
    required this.description,
    required this.type,
    required this.dateAsString,
  });
}

class AppNotificationItem extends StatelessWidget {
  const AppNotificationItem({super.key, required this.notificationUIModel});
  final NotificationUIModel notificationUIModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppStyleConfiguration.itemDefaultHeight * 2,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(children: [
        AspectRatio(
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
        Padding(
          padding: EdgeInsets.only(right: AppStyleConfiguration.paddingSpacer),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notificationUIModel.tittle,
                style: Theme.of(context).textTheme.headline6,
              ),
              AutoSizeText(
                notificationUIModel.description,
                style: Theme.of(context).textTheme.bodyText1,
                maxLines: 1,
                minFontSize: 13,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
