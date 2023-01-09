import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_ui_template_for_sale/bloc/data_bloc/cart_provider/cart_provider.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/widgets/app_item_style_configuration.dart';
import 'app_quantity_manage_bloc.dart';

class AppQuantityManage extends StatefulWidget {
  const AppQuantityManage({
    super.key,
    this.enablePlusAndMinusButtons,
    required this.quantity,
    required this.itemID,
    required this.autoAddToCart,
  });
  final bool? enablePlusAndMinusButtons;
  final int quantity;
  final String itemID;
  final bool autoAddToCart;
  @override
  State<AppQuantityManage> createState() => _AppQuantityManageState();
}

class _AppQuantityManageState extends State<AppQuantityManage> {
  late AppQuantityManageBloc _appQuantityManageBloc;
  @override
  void initState() {
    super.initState();

    _appQuantityManageBloc = AppQuantityManageBloc(
      itemId: widget.itemID,
      autoAddedToCartWithoutConfirm: widget.autoAddToCart,
    );
  }

  @override
  Widget build(BuildContext context) {
    final shouldShowControlButton = widget.enablePlusAndMinusButtons ?? true;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).disabledColor,
        borderRadius:
            BorderRadius.circular(AppStyleConfiguration.itemDefaultHeight / 4),
      ),
      height: AppStyleConfiguration.itemDefaultHeight / 2,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          shouldShowControlButton
              ? CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Material(
                    color: Colors.transparent,
                    child: SizedBox(
                      width: AppStyleConfiguration.itemDefaultHeight / 2,
                      height: AppStyleConfiguration.itemDefaultHeight / 2,
                      child: Center(
                        child: Text(
                          '-',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () => _appQuantityManageBloc.decreaseNumber(),
                )
              : Container(
                  width: 10,
                ),
          SizedBox(
            width: 20,
            child: Center(
              child: StreamBuilder<CartItem?>(
                  stream: _appQuantityManageBloc.observerItemCount(),
                  builder: (context, snapshot) {
                    final textCount =
                        snapshot.data?.numberOfItem.toString() ?? '1';
                    return Text(textCount,
                        style: Theme.of(context).textTheme.bodyText1);
                  }),
            ),
          ),
          shouldShowControlButton
              ? CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Material(
                    color: Colors.transparent,
                    child: SizedBox(
                      width: AppStyleConfiguration.itemDefaultHeight / 2,
                      height: AppStyleConfiguration.itemDefaultHeight / 2,
                      child: Center(
                        child: Text(
                          '+',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () => _appQuantityManageBloc.increaseNumber(),
                )
              : Container(
                  width: 10,
                ),
        ],
      ),
    );
  }
}
