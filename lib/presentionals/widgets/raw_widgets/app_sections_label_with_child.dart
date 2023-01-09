import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';

class AppSectionLabelWithChild extends StatelessWidget {
  const AppSectionLabelWithChild({
    super.key,
    required this.child,
    required this.tittle,
    required this.onSelectAll,
  });
  final Widget child;
  final String tittle;
  final VoidCallback onSelectAll;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Text(
                tittle,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              CupertinoButton(
                onPressed: () => onSelectAll(),
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    'See all',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontStyle: FontStyle.italic,
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const AppVerticalPadding(),
        child,
      ],
    );
  }
}
