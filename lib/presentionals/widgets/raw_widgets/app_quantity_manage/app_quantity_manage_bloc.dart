import 'package:collection/collection.dart';
import 'package:flutter_shop_ui_template_for_sale/bloc/global_bloc.dart';
import 'package:rxdart/rxdart.dart';

class AppQuantityManageBloc {
  final String itemId;
  final bool autoAddedToCartWithoutConfirm;

  AppQuantityManageBloc({
    required this.itemId,
    required this.autoAddedToCartWithoutConfirm,
  });
  Stream<CartItem?> observerItemCount() {
    return GlobalBloc.cartProvider
        .observerCartItems(isLoadAllItemNotAddedInCart: true)
        .switchMap(
          (value) => Stream.value(
            value.firstWhereOrNull(
              (element) => element.itemID == itemId,
            ),
          ),
        );
  }

  increaseNumber() {
    GlobalBloc.cartProvider.pushItemToCart(
      itemId: itemId,
      numberOfItemAdded: 1,
    );
  }

  decreaseNumber() {
    GlobalBloc.cartProvider.decreaseItemFromCart(
      itemId,
      1,
      autoAddedToCartWithoutConfirm,
    );
  }
}
