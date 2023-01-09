import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';

class AppBubbleSelection extends StatelessWidget {
  const AppBubbleSelection({
    super.key,
    required this.selectedIndex,
    required this.items,
    required this.onClicked,
  });
  final int selectedIndex;
  final List<String> items;
  final ValueChanged<int> onClicked;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppStyleConfiguration.itemDefaultHeight,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: AppStyleConfiguration.paddingSpacer),
            height: AppStyleConfiguration.itemDefaultHeight,
            child: AppButton(
              tittle: items[index],
              isCollapsed: true,
              buttonStyle: (index != selectedIndex)
                  ? AppButtonStyle.primariColorBorderOnly
                  : AppButtonStyle.primaryColorBackground,
              onPresssed: () {
                onClicked(index);
              },
            ),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}
