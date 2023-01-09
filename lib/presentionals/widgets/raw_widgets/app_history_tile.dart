import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

enum HistoryTileUIType {
  topup,
  order,
}

class HistoryTileUIModel {
  final HistoryTileUIType type;
  final String? imageUrl;
  final String name;
  final DateTime date;
  final int moneyValue;

  HistoryTileUIModel({
    required this.type,
    required this.imageUrl,
    required this.date,
    required this.name,
    required this.moneyValue,
  });
}

class AppHistoryTile extends StatelessWidget {
  const AppHistoryTile({
    super.key,
    required this.uiInfo,
  });
  final HistoryTileUIModel uiInfo;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              height: AppStyleConfiguration.itemDefaultHeight * 2,
              margin: EdgeInsets.symmetric(
                  horizontal: AppStyleConfiguration.paddingSpacer),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: AppThreePartsButtons(
                leading: _renderIconLeading(Theme.of(context).primaryColor),
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      uiInfo.name,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd hh:mm').format(uiInfo.date),
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .color!
                                .withOpacity(0.5),
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                trailing: (uiInfo.type == HistoryTileUIType.order)
                    ? _renderOrders(
                        10,
                        Theme.of(context).textTheme,
                        Theme.of(context).errorColor,
                      )
                    : _renderTopUp(
                        100,
                        Theme.of(context).textTheme,
                        Theme.of(context).primaryColor,
                      ),
              ),
            ),
            const AppVerticalPadding(),
          ],
        ),
      ),
    );
  }

  Widget _renderIconLeading(Color color) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: AppStyleConfiguration.paddingSpacer),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(AppStyleConfiguration.itemNormalRadius),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            decoration: BoxDecoration(
              color: color,
            ),
            child: uiInfo.type == HistoryTileUIType.topup
                ? const Icon(
                    FontAwesome.landmark,
                    size: 30,
                    color: Colors.white,
                  )
                : FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: uiInfo.imageUrl ?? '',
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }

  Widget _renderTopUp(int moneyInput, TextTheme textTheme, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\$ 10',
            style: textTheme.headline6,
          ),
          Icon(
            BoxIcons.bx_up_arrow,
            color: color,
          )
        ],
      ),
    );
  }

  Widget _renderOrders(int moneyInput, TextTheme textTheme, Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\$ 10',
            style: textTheme.headline6,
          ),
          Icon(
            BoxIcons.bx_down_arrow,
            color: color,
          )
        ],
      ),
    );
  }
}
