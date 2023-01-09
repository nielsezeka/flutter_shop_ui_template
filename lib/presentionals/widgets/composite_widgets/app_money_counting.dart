import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';

class MoneyRowUIModel {
  final String name;
  final int value;

  MoneyRowUIModel({required this.name, required this.value});
}

class MoneyCountUIModel {
  final List<MoneyRowUIModel> items;

  MoneyCountUIModel({required this.items});
}

class AppMoneyCounting extends StatelessWidget {
  const AppMoneyCounting({super.key, required this.moneyList});
  final MoneyCountUIModel moneyList;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppStyleConfiguration.paddingSpacer),
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
      child: Column(
        children: moneyList.items
            .map(
              (e) => AppThreePartsButtons(
                leading: Text(
                  e.name,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                center: Container(),
                trailing: Text(
                  e.value.toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            )
            .whereType<Widget>()
            .toList()
          ..add(Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppStyleConfiguration.paddingSpacer),
            child: Divider(
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ))
          ..add(AppThreePartsButtons(
            leading: Text(
              'Total',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            center: Container(),
            trailing: Text(
              moneyList.items
                  .fold(
                    0,
                    (previousValue, element) => previousValue + element.value,
                  )
                  .toString(),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )),
      ),
    );
  }
}
