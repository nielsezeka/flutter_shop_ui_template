import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';
import '../../global_bloc.dart';
export 'cart_provider_model.dart';

class CartProvider {
  late BehaviorSubject<UserAddress> _currentUserAddress;
  late BehaviorSubject<PromoCode?> _currentPromo;
  late BehaviorSubject<ShippingType?> _currentShippingStream;
  final BehaviorSubject<List<CartItem>> _cartItemsStream =
      BehaviorSubject<List<CartItem>>.seeded([]);
  CartProvider() {
    _currentUserAddress = BehaviorSubject<UserAddress>.seeded(
      GlobalBloc.userDataProvider.observerUserInfo().value.addresses.first,
    );
    _currentPromo = BehaviorSubject<PromoCode?>.seeded(
      GlobalBloc.shippingAndPromoProvider.promoCodesStream.value.firstOrNull,
    );
    _currentShippingStream = BehaviorSubject<ShippingType?>.seeded(
      GlobalBloc.shippingAndPromoProvider.shippingTypesStream.value.firstOrNull,
    );
  }
  changeAddress(UserAddress newAddress) {
    _currentUserAddress.add(newAddress);
  }

  changePromo(PromoCode promoCode) {
    _currentPromo.add(promoCode);
  }

  changeTransport(ShippingType transport) {
    _currentShippingStream.add(transport);
  }

  void pushItemToCart({
    required String itemId,
    required int numberOfItemAdded,
  }) {
    if (numberOfItemAdded == 0) {
      return;
    }
    final currentList = _cartItemsStream.value;
    final foundedItem =
        currentList.firstWhereOrNull((element) => element.itemID == itemId);
    if (foundedItem != null) {
      currentList.removeWhere((element) => element.itemID == itemId);
      currentList.add(
        CartItem(
          itemID: itemId,
          numberOfItem: numberOfItemAdded + foundedItem.numberOfItem,
          isAddedToCart: foundedItem.isAddedToCart,
        ),
      );
    } else {
      currentList.add(
        CartItem(
          itemID: itemId,
          // minor bug fix, the first tap should be increase value to 2,
          // default they has 1 item, so the first tap must changed to 2
          numberOfItem: numberOfItemAdded + 1,
          isAddedToCart: false,
        ),
      );
    }
    _cartItemsStream.add(currentList);
  }

  Stream<List<CartItem>> observerCartItems({
    bool? isLoadAllItemNotAddedInCart,
  }) {
    if (isLoadAllItemNotAddedInCart ?? false) {
      return _cartItemsStream;
    } else {
      return _cartItemsStream.switchMap(
        (value) => Stream.value(
            value.where((element) => element.isAddedToCart).toList()),
      );
    }
  }

  void clearItemFromCart(String itemId) {
    final currentList = _cartItemsStream.value;
    currentList.removeWhere((element) => element.itemID == itemId);
    _cartItemsStream.add(currentList);
  }

  void clearCart() {
    _cartItemsStream.add([]);
  }

  void decreaseItemFromCart(String itemId, int i, bool? isAddedToCart) {
    final currentList = _cartItemsStream.value;
    final foundedItem =
        currentList.firstWhereOrNull((element) => element.itemID == itemId);
    if (foundedItem != null) {
      if (foundedItem.numberOfItem > 1) {
        final totalItem = foundedItem.numberOfItem;
        currentList.removeWhere((element) => element.itemID == itemId);
        currentList.add(
          CartItem(
            itemID: itemId,
            numberOfItem: totalItem - 1,
            isAddedToCart: isAddedToCart ?? true,
          ),
        );
      }
    }
    _cartItemsStream.add(currentList);
  }

  void confirmAddedToCart({required String itemId}) {
    final currentList = _cartItemsStream.value;
    final foundedItem =
        currentList.firstWhereOrNull((element) => element.itemID == itemId);
    if (foundedItem != null) {
      currentList.removeWhere((element) => element.itemID == itemId);
      currentList.add(
        foundedItem.copyWith(isAddedToCart: true),
      );
    } else {
      currentList.add(
        CartItem(
          itemID: itemId,
          numberOfItem: 1,
          isAddedToCart: true,
        ),
      );
    }
    _cartItemsStream.add(currentList);
  }

  Stream<AddressForCartItemModel> observerAddressForCart() {
    return Rx.combineLatest2(
      _currentUserAddress,
      GlobalBloc.userDataProvider.observerUserInfo(),
      (a, b) => AddressForCartItemModel(
        selectedAddress: a,
        userAdresses: b.addresses,
      ),
    );
  }

  Stream<PromosForCartItemModel> observerPromosForCart() {
    return Rx.combineLatest2(
      _currentPromo,
      GlobalBloc.shippingAndPromoProvider.promoCodesStream,
      (a, b) => PromosForCartItemModel(
        selectedPromo: a ??
            PromoCode(
              promoCodeName: '',
              promoID: '',
              promoTittle: '',
              promoDescription: '',
            ),
        promosCode: b,
      ),
    );
  }

  Stream<ShippingTypeForCartItemModel> observerTransportForCart() {
    return Rx.combineLatest2(
      _currentShippingStream,
      GlobalBloc.shippingAndPromoProvider.shippingTypesStream,
      (a, b) => ShippingTypeForCartItemModel(
        promosCode: b,
        selectedPromo: a ??
            ShippingType(
              shippingTittle: '',
              shippingDescription: '',
              shippingID: '',
              cost: 0,
            ),
      ),
    );
  }

  void makePromoCleared() {
    _currentPromo.add(null);
  }
}
