import 'package:collection/collection.dart';
import 'package:flutter_shop_ui_template_for_sale/bloc/global_bloc.dart';
import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';
import 'package:rxdart/rxdart.dart';

class CartItemScreenBloc {
  static final CartItemScreenBloc cartItemScreenBloc = CartItemScreenBloc();

  deleteItemInCard(String id) {
    GlobalBloc.cartProvider.clearItemFromCart(id);
  }

  Stream<List<CartItemUIModel>> observerCartItem() {
    return Rx.combineLatest2(
      GlobalBloc.cartProvider.observerCartItems(),
      GlobalBloc.productDataBloc.observerAllProducts(),
      (
        List<CartItem> itemInCarts,
        List<ProductModeFromBackend> products,
      ) {
        return itemInCarts
            .map((e) {
              final item = products
                  .firstWhereOrNull((element) => element.productID == e.itemID);
              if (item != null) {
                return CartItemUIModel.from(item, e.numberOfItem);
              }
            })
            .whereType<CartItemUIModel>()
            .toList()
            .sorted((a, b) => a.cartItemId.compareTo(b.cartItemId));
      },
    );
  }

  Stream<int> observerTotalCount() {
    return observerCartItem().switchMap(
      (value) => Stream.value(value.fold(
        0,
        (value, element) => value + element.price * element.totalItem,
      )),
    );
  }

  clearPromo() {
    GlobalBloc.cartProvider.makePromoCleared();
  }
}
