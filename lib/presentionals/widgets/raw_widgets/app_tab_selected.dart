import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'package:flutter_shop_ui_template_for_sale/theme/custom_theme.dart';

class AppTabSelected extends StatefulWidget {
  const AppTabSelected(
      {super.key, required this.items, required this.onTabSelected});
  final List<String> items;
  final ValueChanged<int> onTabSelected;
  @override
  State<AppTabSelected> createState() => _AppTabSelectedState();
}

class _AppTabSelectedState extends State<AppTabSelected> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppStyleConfiguration.itemDefaultHeight,
          child: Row(
            children: widget.items
                .asMap()
                .map(
                  (key, value) => MapEntry(
                    key,
                    Expanded(
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => setState(() {
                          selectedIndex = key;
                          widget.onTabSelected(selectedIndex);
                        }),
                        child: Center(
                          child: Text(
                            value,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: selectedIndex == key
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context).disabledColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .values
                .toList(),
          ),
        ),
        LayoutBuilder(builder: (context, constrait) {
          return Stack(
            children: [
              Container(
                height: 5,
                color: Theme.of(context).cardColor,
              ),
              AnimatedPositioned(
                duration: CustomTheme.animationDuration,
                left: selectedIndex * constrait.maxWidth / 2,
                width: constrait.maxWidth / 2,
                top: 0,
                bottom: 0,
                child: Container(
                  height: 5,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          );
        })
      ],
    );
  }
}
