import '../../global_bloc.dart';

class CartItem {
  final String itemID;
  final int numberOfItem;
  final bool isAddedToCart;

  CartItem({
    required this.itemID,
    required this.numberOfItem,
    required this.isAddedToCart,
  });
  copyWith({
    String? itemID,
    int? numberOfItem,
    bool? isAddedToCart,
  }) {
    return CartItem(
      itemID: itemID ?? this.itemID,
      numberOfItem: numberOfItem ?? this.numberOfItem,
      isAddedToCart: isAddedToCart ?? this.isAddedToCart,
    );
  }
}

class AddressForCartItemModel {
  final List<UserAddress> userAdresses;
  final UserAddress selectedAddress;

  AddressForCartItemModel({
    required this.userAdresses,
    required this.selectedAddress,
  });
}

class PromosForCartItemModel {
  final List<PromoCode> promosCode;
  final PromoCode selectedPromo;

  PromosForCartItemModel({
    required this.promosCode,
    required this.selectedPromo,
  });
}

class ShippingTypeForCartItemModel {
  final List<ShippingType> promosCode;
  final ShippingType selectedPromo;

  ShippingTypeForCartItemModel({
    required this.promosCode,
    required this.selectedPromo,
  });
}
